class AddHashToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :userhash
    end
  end

  def self.down
    remove_column :users, :userhash
  end
end
