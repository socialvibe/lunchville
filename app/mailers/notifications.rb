class Notifications < ActionMailer::Base
  default :from => "no-reply@svnetwork.com"
  
  def submit_proposals(user)
    @proposal_url = new_proposal_url(:host => HOST, :user_hash => user.user_hash)
    
    mail(
      :to => user.email,
      :subject => "Lunchville:  Time to submit lunch proposals for this week"
    )
  end
  
  def vote_on_proposals(user)
    @vote_url = proposals_url(:host => HOST, :user_hash => user.user_hash)

    mail(
      :to => user.email,
      :subject => "Lunchville:  Time to vote on your lunch"
    )
  end
  
  def submit_orders(user, restaurant)
    @restaurant = restaurant
    @order_url = new_order_url(:host => HOST, :user_hash => user.user_hash)
    
    mail(
      :to => user.email,
      :subject => "Lunchville:  This week for lunch:  #{@restaurant.name}"
    )
  end
  
  def all_orders_placed(lunch)
    @lunch = lunch
    @summary_url = orders_url(:host => HOST)
    
    mail(
      :to => "chris@svnetwork.com", #TODO: replace with tamara
      :subject => "Lunchville:  All orders are placed"
    )
  end
end
