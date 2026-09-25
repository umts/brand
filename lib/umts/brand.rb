# frozen_string_literal: true

require_relative 'brand/engine'
require_relative 'brand/version'

module UMTS
  module Brand
    class << self
      attr_reader :using_university_trademarks

      def use_university_trademarks!
        Rails.application.config.assets.paths += [trademark_root]
        Rails.application.config.assets.precompile += trademark_paths
        @using_university_trademarks = true
      end

      def protect_university_trademarks!
        return if using_university_trademarks

        raise 'Not opted in to university trademarks'
      end

      private

      def trademark_root = Engine.root.join('app/trademarks/')

      def trademark_paths = Dir.glob(trademark_root.join('**/*')).reject { |path| File.directory?(path) }
    end
  end
end
