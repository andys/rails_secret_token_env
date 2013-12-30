require 'helper'

class TestRailsSecretTokenEnv < MiniTest::Unit::TestCase
  def setup
    boot_rails
  end

  def test_initializer_loaded
    initializers = Rails.application.initializers.tsort
    index        = initializers.index { |i| i.name == "my_railtie.configure_rails_initialization" }
    selection    = initializers[(index-3)..(index)].map(&:name).map(&:to_s)

    assert_equal %w(
      active_support.initialize_beginning_of_week
      active_support.set_configs
      action_dispatch.configure
      my_railtie.configure_rails_initialization
    ), selection

    assert index < initializers.index { |i| i.name == :build_middleware_stack }
  end

  def test_initializer_for_rails3_with_defaults
    assert_match ('x' * 30), Rails.configuration.secret_token
    refute_nil Rails.configuration.secret_token
  end

  def test_initializer_for_rails4_with_defaults
    assert_match ('x' * 30), Rails.configuration.secret_key_base
    refute_nil Rails.configuration.secret_key_base
  end

  def boot_rails
    require 'rails_app/config/environment'
  end

  def env_var
    @env_var ||= SecureRandom.hex
    @env_var
  end
end
