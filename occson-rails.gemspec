require_relative "lib/occson/rails/version"

Gem::Specification.new do |spec|
  spec.name        = "occson-rails"
  spec.version     = Occson::Rails::VERSION
  spec.authors     = ["Tomasz Kowalewski"]
  spec.email       = ["me@tkowalewski.pl"]
  spec.homepage    = "https://github.com/occson/occson-rails"
  spec.summary     = "Store, manage and deploy configuration securely with Occson."
  spec.description = ""
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/occson/occson-rails"
  spec.metadata["changelog_uri"] = "https://github.com/occson/occson-rails/blob/master/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]

  spec.add_dependency "rails", "#{ENV['TEST_RAILS_VERSION'] || '>= 5.2'}"
  spec.add_dependency "occson", "4.1.0"

  spec.required_ruby_version = '>= 2.7.0'
end
