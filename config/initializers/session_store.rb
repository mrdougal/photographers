# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photo_session',
  :secret      => 'b700d87470a6d64967703d1352872793c024929bdd6f556c9861c804b103a85ea9c36b28a53e7ec42bcd297501750448fe6ea3a21a8ab7fb514a8370532a7bca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
