class Lunch < ActiveRecord::Base
  belongs_to :proposal, {:foreign_key => :winning_proposal_id}
  
end
