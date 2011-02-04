class AddHashToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :user_hash
    end
  end

  def self.down
    remove_column :users, :user_hash
  end
end
