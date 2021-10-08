module Occson
  module Rails
    class ApplicationVersion
      UndefinedApplicationVersionError = Class.new(StandardError)

      def initialize(application)
        @application = application
      end

      def call
        raise UndefinedApplicationVersionError, "Uninitialized constant #{const}" unless Object.const_defined?(const)

        Object.const_get(const)
      end

      private

      def const
        @_const ||= class_name.sub('Application', 'VERSION')
      end

      def class_name
        @application.class.to_s
      end
    end
  end
end
