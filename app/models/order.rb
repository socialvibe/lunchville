class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch
  
  after_create :notify_if_everyone_has_ordered
  
  def self.for_today
    Lunch.for_today.orders
  end
  
  protected
  
    def notify_if_everyone_has_ordered
      Notifications.all_orders_placed(lunch).deliver if lunch.everyone_has_ordered?
    end
end
