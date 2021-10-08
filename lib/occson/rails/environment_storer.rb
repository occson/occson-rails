module Occson
  module Rails
    class EnvironmentStorer
      def initialize(environment)
        @environment = environment
      end

      def call
        @environment.each do |key, value|
          ENV.store(key, value)
        end
      end
    end
  end
end
