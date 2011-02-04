class User < ActiveRecord::Base
  validates_presence_of :name
  has_many :orders
  has_many :proposals

  before_create{ |u| u.userhash = ActiveSupport::SecureRandom.hex(16) }
end