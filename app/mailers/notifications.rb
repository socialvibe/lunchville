class Notifications < ActionMailer::Base
  default :from => "no-reply@svnetwork.com"
  
  def submit_proposals(user)
    @proposal_url = "TODO"
    
    mail(
      :to => user.email,
      :subject => "Time to submit lunch proposals for this week"
    )
  end
  
  def vote_on_proposals(user)
    @vote_url = "TODO"

    mail(
      :to => user.email,
      :subject => "Time to vote on your lunch"
    )
  end
  
  def submit_orders(user, restaurant)
    @restaurant = restaurant
    @order_url = "TODO"
    
    mail(
      :to => user.email,
      :subject => "This week for lunch:  #{@restaurant.name}"
    )
  end
end
