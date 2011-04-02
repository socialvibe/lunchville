class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch
  belongs_to :restaurant
  
  def to_gallery_object
    { :id => id,
      :name => restaurant.name, 
      :subtext => 'proposed by ' + user.name, 
      :image_url => restaurant.image_url,
      :links => {
        'Website' => restaurant.menu_url,
        'Menu' => restaurant.menu_url
      }
    }
  end
end
