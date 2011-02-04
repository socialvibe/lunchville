class CreateProposals < ActiveRecord::Migration
  def self.up
    create_table :proposals do |t|
      t.integer :lunch_id
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :votes

      t.timestamps
    end
    add_index :proposals, :lunch_id
    add_index :proposals, :user_id
    add_index :proposals, :restaurant_id
  end

  def self.down
    drop_table :proposals
  end
end
