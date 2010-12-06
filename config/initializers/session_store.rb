# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_opinions1_session',
  :secret      => '312f8a393d7115208bc2d5fc5701cc7d81b1d71349cad51c9bb0fc30972e8b0b4f1720551859d7f93dc925180f0dc9f4282a3296972b8fdcc6831c0c3878d90e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
