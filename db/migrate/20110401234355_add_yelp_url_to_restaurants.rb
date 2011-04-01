class AddYelpUrlToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :yelp_url, :string
  end

  def self.down
    remove_column :restaurants, :yelp_url
  end
end
