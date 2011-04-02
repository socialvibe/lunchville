class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch
  belongs_to :restaurant
  
  validates_uniqueness_of :user_id, :scope => :lunch_id
  
  def to_gallery_object
    links = {}
    links['Website'] = restaurant.url unless restaurant.url.blank? 
    links['Menu'] = restaurant.menu_url unless restaurant.menu_url.blank? 
    
    { :id => id,
      :name => restaurant.name, 
      :subtext => 'proposed by ' + user.name, 
      :image_url => restaurant.image_url,
      :links => links
    }
  end
end
