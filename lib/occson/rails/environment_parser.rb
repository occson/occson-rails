module Occson
  module Rails
    class EnvironmentParser
      def initialize(content)
        @content = content
      end

      def call
        Hash[parse]
      end

      private

      def parse
        @content.split("\n").map do |line|
          next if line.start_with?('#')

          line.split("=", 2) # @TODO handle wrapped values
        end.compact
      end
    end
  end
end
