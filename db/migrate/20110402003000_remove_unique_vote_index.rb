class RemoveUniqueVoteIndex < ActiveRecord::Migration
  def self.up
    remove_index :votes, :name => 'fk_one_vote_per_user_per_entity'
  end

  def self.down
    add_index :votes, [:voter_id, :voter_type, :voteable_id, :voteable_type], :unique => true, :name => 'fk_one_vote_per_user_per_entity'
  end
end
