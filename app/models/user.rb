class User < ActiveRecord::Base
  has_many :orders
  has_many :proposals
  
  ajaxful_rater
  
end
