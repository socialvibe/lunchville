class Notifications < ActionMailer::Base

  def submit_proposals(sent_at = Time.now)
    subject    'Notifications#submit_proposals'
    recipients 'chris@svnetwork.com'
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

  def vote_on_proposals(sent_at = Time.now)
    subject    'Notifications#vote_on_proposals'
    recipients 'chris@svnetwork.com'
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

  def submit_orders(sent_at = Time.now)
    subject    'Notifications#submit_orders'
    recipients 'chris@svnetwork.com'
    from       'lunch@svnetwork.com'
    sent_on    sent_at
    
    body       :greeting => 'Hi,'
  end

end
