require "test_helper"

module Fake
  class Application; end
end

class Occson::Rails::ApplicationVersionTest < ActiveSupport::TestCase
  test "should raise an exception on uninitialized version constant" do
    assert_raises(Occson::Rails::ApplicationVersion::UndefinedApplicationVersionError) do
      Occson::Rails::ApplicationVersion.new(Fake::Application.new).call
    end
  end

  test "should return application version number" do
    application_version = Occson::Rails::ApplicationVersion.new(::Rails.application).call

    assert_equal("0.1.0", application_version)
  end
end
