class AddLunchIdToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :lunch_id, :integer
    add_index :orders, :lunch_id
  end

  def self.down
    remove_index :orders, :lunch_id
    remove_column :orders, :lunch_id
  end
end