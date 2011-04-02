class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch
  belongs_to :restaurant
  
  validates_uniqueness_of :user_id, :scope => :lunch_id
  
  def to_gallery_object
    { :id => id,
      :name => restaurant.name, 
      :subtext => 'proposed by ' + user.name, 
      :image_url => restaurant.image_url,
      :links => {
        'Website' => restaurant.url,
        'Menu' => restaurant.menu_url
      }
    }
  end
end
