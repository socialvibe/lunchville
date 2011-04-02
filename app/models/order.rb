class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch
  
  after_create :notify_if_everyone_has_ordered
  
  validates_presence_of :description
  validates_uniqueness_of :user_id, :scope => :lunch_id
  
  def self.for_today
    Lunch.for_today.orders
  end
  
  protected
  
    def notify_if_everyone_has_ordered
      Notifications.all_orders_placed(lunch).deliver if lunch.everyone_has_ordered?
    end
end
