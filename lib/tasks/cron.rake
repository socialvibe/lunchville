desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  case Date::DAYNAMES[Time.now.wday]
  when "Monday"
    User.notify_open_proposals
  when "Tuesday"
    User.notify_vote_on_proposals
  when "Wednesday"
    Lunch.prepare_for_today
  end
end
