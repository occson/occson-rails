require 'occson'

require_relative 'application_version'
require_relative 'environment_storer'
require_relative 'environment_loader'

module Occson
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Occson::Rails

      config.before_configuration do
        EnvironmentLoader.new(::Rails.root, ::Rails.env).call

        unless ENV.key?('OCCSON_ACCESS_TOKEN') && ENV.key?('OCCSON_PASSPHRASE')
          puts "Oh my, occson will not load configuration. Please setup OCCSON_ACCESS_TOKEN and OCCSON_PASSPHRASE"

          next
        end

        version = ApplicationVersion.new(::Rails.application).call
        uri = "occson://#{version}/.env"
        access_token = ENV.fetch('OCCSON_ACCESS_TOKEN')
        passphrase = ENV.fetch('OCCSON_PASSPHRASE')

        document = Occson::Document.new(uri, access_token, passphrase).download

        if document.blank?
          puts "Oh my, occson will not load configuration. Can't download document"

          next
        end

        EnvironmentStorer.new(document).call
      end
    end
  end
end
