class Lunch < ActiveRecord::Base
  acts_as_voteable
  
  belongs_to :proposal, :foreign_key => :winning_proposal_id
  
end
