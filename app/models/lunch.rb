class Lunch < ActiveRecord::Base
  acts_as_voteable
  
  has_many :orders
  has_many :proposals
  has_one :proposal, :foreign_key => :winning_proposal_id
  
  validates :occuring_on, :date => true
  
  delegate :restaurant, :to => :proposal
  
  class << self
    def for_today
      self.find(:first, :conditions => {:occuring_on => Date.today})
    end
    def next
      self.find(:first, :conditions => ["occuring_on > ?", Date.today])
    end
    def prepare_for_today    
      lunch = self.for_today
      lunch.choose_winner
      lunch.request_orders
      create_next_lunch!
    end
    def create_next_lunch!
      Lunch.create!(:occuring_on => 1.week.from_now)
    end
  end
  
  def users_missing_orders
    User.all - orders.map(&:user)
  end
  
  def everyone_has_ordered?
    users_missing_orders.empty?
  end
  
  def can_be_ordered_now?
    restaurant_is_chosen? && is_for_today? && (Time.now < Chronic.parse('Today at 11am'))
  end
  
  def is_for_today?
    occuring_on == Date.today
  end
  
  def restaurant_is_chosen?
    restaurant.present?
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
