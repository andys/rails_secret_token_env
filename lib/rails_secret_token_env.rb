require 'rails'

class RailsSecretTokenEnv < Rails::Railtie
  initializer "my_railtie.configure_rails_initialization" do |app|
    Rails.logger.error "RailsSecretTokenEnv SECURITY WARNING: Missing SECRET_TOKEN environment variable in prod!" if ENV['SECRET_TOKEN'].blank? && Rails.env.production?

    if Rails.version >= '4'
      app.config.secret_key_base = token
    end

    app.config.secret_token = token
  end

  private

  def token
    ENV['SECRET_TOKEN'] || ('x' * 30)
  end
end
