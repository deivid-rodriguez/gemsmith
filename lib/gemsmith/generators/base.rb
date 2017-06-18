# frozen_string_literal: true

module Gemsmith
  module Generators
    # Abstract class from which all generators inherit from.
    class Base
      LIB_ROOT = File.join("%gem_name%", "lib").freeze

      def initialize cli, configuration: {}
        @cli = cli
        @configuration = configuration
      end

      def self.run cli, configuration: {}
        new(cli, configuration: configuration).run
      end

      def run
        fail NotImplementedError, "The method, #run, is not implemented yet."
      end

      protected

      attr_reader :cli, :configuration

      # :reek:UtilityFunction
      def lib_gem_root
        File.join LIB_ROOT, "%gem_path%"
      end

      def gem_name
        configuration.dig :gem, :name
      end

      def gem_path
        configuration.dig :gem, :path
      end

      def gem_root
        File.join cli.destination_root, gem_name
      end
    end
  end
end
