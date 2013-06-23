### Manage config.secret_token with environment variable

Put this in your rails app's Gemfile:

    gem 'rails_secret_token_env'

This will set your app's config.secret_token to the SECRET_TOKEN environment
variable.  

In production mode, it will raise an error if the variable is missing. (In
development mode, it will default to 'xxxxxx' if not found)

See also: gem 'dotenv'
