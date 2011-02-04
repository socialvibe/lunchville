class User < ActiveRecord::Base
  acts_as_voter
  validates_presence_of :email
  has_many :orders
  has_many :proposals
  
  before_create{|user| user.user_hash = ActiveSupport::SecureRandom.hex(16) }
  ajaxful_rater
  
end
