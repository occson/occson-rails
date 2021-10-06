module Occson
  module Rails
    class EnvironmentLoader
      def initialize(root, environment)
        @root = root
        @environment = environment
      end

      def call
        files.each do |file|
          next unless File.exist?(file)

          EnvironmentStorer.new(File.read(file)).call
        end
      end

      private

      def files
        [
          @root.join(".env"),
          @root.join(".env.#{@environment}"),
          @root.join(".env.#{@environment}.local")
        ]
      end
    end
  end
end
