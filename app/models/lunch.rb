class Lunch < ActiveRecord::Base
  acts_as_voteable
  
  has_many :orders
  has_many :proposals
  belongs_to :winning_proposal, :class_name => 'Proposal'
  
  validates :occuring_on, :date => true
  validates_uniqueness_of :occuring_on
  
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
      Lunch.create!(:occuring_on => Chronic.parse('next wednesday'))
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
    self.winning_proposal = Proposal.find(:first, :conditions => {:lunch_id => self.id}, :order => 'votes DESC')
    save!
  end
  
  def request_orders
    User.all.each do |user|
      Notifications.deliver_submit_orders(user, winning_proposal.restaurant)
    end
  end
  
end
