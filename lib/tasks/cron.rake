desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  Date::DAYNAMES[Time.now.wday]
end
