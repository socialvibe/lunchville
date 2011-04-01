class User < ActiveRecord::Base
  acts_as_voter
  ajaxful_rater
  
  has_many :orders
  has_many :proposals  
  
  before_create {|user| user.user_hash = ActiveSupport::SecureRandom.hex(16) }
  
  validates_presence_of :email
  
  class << self
    def notify_open_proposals
      self.each do |user|
        Notifications.submit_proposals(user).deliver
      end
    end
  
    def notify_vote_on_proposals
      self.each do |user|
        Notifications.vote_on_proposals(user).deliver
      end
    end
  end
  
  def name
    email.split('@').first
  end
  
end
