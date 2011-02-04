class AddMenuUrlToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :menu_url, :string
  end

  def self.down
    remove_column :restaurants, :menu_url
  end
end
