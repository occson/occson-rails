require "test_helper"

class Occson::Rails::EnvironmentLoaderTest < ActiveSupport::TestCase
  test "should load environment variables from .env file" do
    root = ::Rails.root
    environment = ::Rails.env

    environment_loader = Occson::Rails::EnvironmentLoader.new(root, environment)
    environment_loader.call

    assert_equal "token", ENV.fetch("OCCSON_ACCESS_TOKEN")
    assert_equal "passphrase", ENV.fetch("OCCSON_PASSPHRASE")
  end
end
