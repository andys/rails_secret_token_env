require 'rails'

class RailsSecretTokenEnv < Rails::Railtie
  initializer "my_railtie.configure_rails_initialization" do |app|
    raise "Missing SECRET_TOKEN environment" if ENV['SECRET_TOKEN'].blank? && Rails.env.production?
    app.config.secret_token = ENV['SECRET_TOKEN'] || ('x' * 30)
  end
end
