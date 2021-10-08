require "test_helper"

class Occson::Rails::EnvironmentParserTest < ActiveSupport::TestCase
  test "should parse environment variables from provided content" do
    content = "FOO=bar\nKABOOM=1"

    environment_storer = Occson::Rails::EnvironmentParser.new(content)
    expected_hash = {
      "FOO" => "bar",
      "KABOOM" => "1"
    }

    assert_equal expected_hash, environment_storer.call
  end
end
