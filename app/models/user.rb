class User < ActiveRecord::Base
  acts_as_voter
  ajaxful_rater
  
  has_many :orders
  has_many :proposals  
  
  before_create {|user| user.user_hash = ActiveSupport::SecureRandom.hex(16); user.lunch_bucks = 3 }
  
  validates_presence_of :email
  validates_presence_of :gender
  validates_inclusion_of :gender, :in => %w(male female)
  
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
  
  def decrement_lunch_bucks!(amount)
    raise "not enough cash" unless lunch_bucks >= amount
    self.lunch_bucks -= amount
    save
  end
end
