require 'rails'

class RailsSecretTokenEnv < Rails::Railtie
  initializer "my_railtie.configure_rails_initialization" do |app|
    Rails.logger.error "RailsSecretTokenEnv SECURITY WARNING: Missing SECRET_TOKEN environment variable in prod!" if ENV['SECRET_TOKEN'].blank? && Rails.env.production?
    app.config.secret_token = ENV['SECRET_TOKEN'] || ('x' * 30)
    app.config.secret_key_base = app.config.secret_token
  end
end
