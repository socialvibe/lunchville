class Lunch < ActiveRecord::Base
  belongs_to :proposal, :foreign_key => :winning_proposal_id
  
  delegate :restaurant, :to => :proposal
  
  class << self
    def for_today
      self.find(:first, :conditions => {:occuring_on => Date.today})
    end
    def prepare_for_today    
      lunch = self.for_today
      lunch.choose_winner
      lunch.request_orders
    end
  end
  
  def choose_winner
    self.proposal = Proposal.find(:first, :conditions => {:lunch_id => self.id}, :order => 'votes DESC')
    save!
  end
  
  def request_orders
    User.all.each do |user|
      Notifications.deliver_submit_orders(user, self.restaurant)
    end
  end
  
end
