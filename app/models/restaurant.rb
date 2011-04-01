class Restaurant < ActiveRecord::Base
   #ajaxful_rateable :stars => 5
   
   validates :name, :presence => true
end
