# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_web_session',
  :secret      => 'f87ce552c4d091ab55e136c10e1f82b465f8ee5721bab6294ce8b57fcf76b1ff398c5bfe0d80702e6eecaf0632ecf13ad2f1f1051b20eb4cb8a0327f41b2a0a4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
