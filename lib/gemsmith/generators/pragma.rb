# frozen_string_literal: true

require "pathname"
require "pragmater"

module Gemsmith
  module Generators
    # Formats pragma comments in source files.
    class Pragma < Base
      def self.comments
        ["# frozen_string_literal: true"]
      end

      # rubocop:disable Metrics/MethodLength
      def includes
        %W[
          **/*Gemfile
          **/*Guardfile
          **/*Rakefile
          **/*config.ru
          **/*bin/#{configuration.dig :gem, :name}
          **/*bin/bundle
          **/*bin/rails
          **/*bin/rake
          **/*bin/setup
          **/*bin/update
          **/*bin/yarn
          **/*.gemspec
          **/*.rake
          **/*.rb
        ]
      end
      # rubocop:enable Metrics/MethodLength

      def run
        Pragmater::Runner.new(
          gem_root,
          comments: self.class.comments,
          includes: includes
        ).run action: :add
      end
    end
  end
end
