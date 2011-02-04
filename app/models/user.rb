class User < ActiveRecord::Base
  validates_presence_of :name
  has_many :orders
  has_many :proposals
  
  ajaxful_rater
  
end
