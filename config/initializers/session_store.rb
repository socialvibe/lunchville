# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lunchville_session',
  :secret      => '1fea9febc63d249f3a40fa3e38622732caf41597c28f4f48b70d502cfd5f2ed37a5f8fc086353ba140bbd5aecb5dd1f9433adda9e80d19bee618cfd09c60b4ab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
