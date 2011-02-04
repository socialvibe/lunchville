class CreateLunches < ActiveRecord::Migration
  def self.up
    create_table :lunches do |t|
      t.date :occuring_on
      t.integer :winning_proposal_id

      t.timestamps
    end
    add_index :lunches, :winning_proposal_id
  end

  def self.down
    drop_table :lunches
  end
end
