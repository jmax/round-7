# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_organizer_session',
  :secret      => 'c25821c0ab740461f4c004a5010e80d61cfaa543e4153b9f2a6f7070fe7efef542eab1a64c1f4321522ba06222d07bb0ccea67c210583eec6580af103e98f333'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
