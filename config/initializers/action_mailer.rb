ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "svnetwork.com",
  :authentication => :plain,
  :user_name => "no-reply@svnetwork.com",
  :password => "pinkbrawler"
}
