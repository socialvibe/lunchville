class AddFamilyStyleToRestaurants < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :family_style, :boolean
  end

  def self.down
    remove_column :restaurants, :family_style
  end
end
