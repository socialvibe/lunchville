class Notifications < ActionMailer::Base
  default_url_options[:host] = WEB_HOST
  
  def submit_proposals(user, sent_at = Time.now)
    subject    '[Lunchville] - Time to submit lunch proposals for this week'
    recipients user.email
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :user => user, :proposal_url => new_proposal_url(:user_hash => user.user_hash)
  end

  def vote_on_proposals(user, sent_at = Time.now)
    subject    '[Lunchville] - Time to vote on your lunch'
    recipients user.email
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :user => user, :vote_url => 'TODO:'
  end

  def submit_orders(user, restaurant, sent_at = Time.now)
    restaurant_name = restaurant.name
    subject    '[Lunchville] - This week for lunch:  #{restaurant_name}'
    recipients user.email
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :user => user, :restaurant_name => restaurant_name, :order_url => 'TODO:' 
  end

end
