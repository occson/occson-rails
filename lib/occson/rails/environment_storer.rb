module Occson
  module Rails
    class EnvironmentStorer
      def initialize(content)
        @content = content
      end

      def call
        @content.split("\n").each do |line|
          next if line.start_with?('#')

          key, value = line.split("=", 2) # @TODO handle wrapped values

          ENV.store(key, value)
        end
      end
    end
  end
end
