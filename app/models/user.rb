class User < ActiveRecord::Base
  acts_as_voter
  ajaxful_rater
  validates_presence_of :email
  has_many :orders
  has_many :proposals
  
  before_create{|user| user.user_hash = ActiveSupport::SecureRandom.hex(16) }
  
  class << self
    def notify_open_proposals
      self.each do |user|
        Notifications.deliver_submit_proposals(user)
      end
    end
  
    def notify_vote_on_proposals
      self.each do |user|
        Notifications.deliver_vote_on_proposals(user)
      end
    end
  end
  
end
