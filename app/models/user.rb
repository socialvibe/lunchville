class User < ActiveRecord::Base
  has_many :orders
  has_many :proposals

end
