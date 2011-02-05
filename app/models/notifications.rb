class Notifications < ActionMailer::Base
  default_url_options[:host] = WEB_HOST
  
  def submit_proposals(user, sent_at = Time.now)
    subject    'Time to submit lunch proposals for this week'
    recipients user.email
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :user => user, :proposal_url => new_proposal_url(:user_hash => user.user_hash)
  end

  def vote_on_proposals(user, sent_at = Time.now)
    subject    'Notifications#vote_on_proposals'
    recipients user.email
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :user => user, :vote_url => 
  end

  def submit_orders(user, sent_at = Time.now)
    subject    'Notifications#submit_orders'
    recipients user.email
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :user => user
  end

end
