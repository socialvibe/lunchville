class AddImageUrlToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :image_url, :string
  end

  def self.down
    remove_column :restaurants, :image_url
  end
end
