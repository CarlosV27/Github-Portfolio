# Here is defined the session store cookie structure
# The session store is used to store the session id
# The session id is used to identify the user
# The session id is stored in the cookie
# The session id is used to retrieve the user from the database

if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "jdh-authentication-app-api.herokuapp.com"
  else
    Rails.application.config.session_store :cookie_store, key: "_authentication_app"
  end
  