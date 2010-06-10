# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_apitest-6.7_session',
  :secret      => '4dea692886d5bee0f3d3e42fe25ecfbab607bbf1a50cf87e84fe18c128cbcf678400fd7f0c266283ef36f50cbd05081c5e3ed8c7e79a58e96f360822c6489240'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
