class Restaurant < ActiveRecord::Base
   ajaxful_rateable :stars => 5
   
   validates :name, :presence => true
   
   def to_gallery_object
     links = {}
     links['Website'] = url unless url.blank? 
     links['Menu'] = menu_url unless menu_url.blank? 

     { :id => id,
       :name => name, 
       :image_url => image_url,
       :links => links
     }
   end
end
