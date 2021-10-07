require "test_helper"

class Occson::Rails::EnvironmentStorerTest < ActiveSupport::TestCase
  test "should store environment variables from provided content" do
    content = "FOO=bar\nKABOOM=1"

    environment_storer = Occson::Rails::EnvironmentStorer.new(content)
    environment_storer.call

    assert_equal "bar", ENV.fetch("FOO")
    assert_equal "1", ENV.fetch("KABOOM")
  end
end
