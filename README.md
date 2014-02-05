### Manage config.secret_token with environment variable

Put this in your rails app's Gemfile:

    gem 'rails_secret_token_env'

This will set your app's config.secret_token to the SECRET_TOKEN environment
variable.  You should delete the default config/initializer/secret_token.rb file.

For rails 4, it also sets app.config.secret_key_base

In production mode, it will log an error if the variable is missing.

(In development mode, it will default to 'xxxxxx' if not found)

See also: gem 'dotenv' and 'dotenv-rails'
