class User < ActiveRecord::Base
  acts_as_voter
  ajaxful_rater
  validates_presence_of :email
  has_many :orders
  has_many :proposals  
  before_create{|user| user.user_hash = ActiveSupport::SecureRandom.hex(16) }
  
end
