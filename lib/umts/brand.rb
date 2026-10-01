# frozen_string_literal: true

require_relative 'brand/engine'
require_relative 'brand/version'

module UMTS
  module Brand
    class << self
      attr_reader :using_university_trademarks, :using_dynamic_error_pages, :errors_parent_controller

      def use_university_trademarks!
        Rails.application.config.assets.paths += [trademark_root]
        Rails.application.config.assets.precompile += trademark_paths
        @using_university_trademarks = true
      end

      def protect_university_trademarks!
        return if using_university_trademarks

        raise 'Not opted in to university trademarks'
      end

      def use_dynamic_error_pages!(parent_controller: 'ApplicationController')
        Rails.application.config.exceptions_app = Rails.application.routes
        @errors_parent_controller = parent_controller
        @using_dynamic_error_pages = true
      end

      private

      def trademark_root = Engine.root.join('app/trademarks/')

      def trademark_paths = Dir.glob(trademark_root.join('**/*')).reject { |path| File.directory?(path) }
    end
  end
end
