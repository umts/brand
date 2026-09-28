# frozen_string_literal: true

require 'rails'

module UMTS
  module Brand
    class Engine < ::Rails::Engine
      initializer 'umts-brand.asset' do
        Rails.application.config.assets.paths << Rails.root.join('node_modules/@fontsource/public-sans/files')
        Rails.application.config.assets.paths << Rails.root.join('node_modules/@fortawesome/fontawesome-free/webfonts')
      end

      initializer 'umts-brand.inflection' do
        ActiveSupport::Inflector.inflections do |inflect|
          inflect.acronym 'UMTS'
        end
      end

      initializer 'umts-brand.kaminari-config' do
        next unless defined?(Kaminari) # simplecov:disable branch

        Kaminari.configure do |config|
          config.default_per_page = 50
          config.window = 3
          config.outer_window = 1
        end
      end

      initializer 'umts-brand.kaminari-views' do
        next unless defined?(Kaminari) # simplecov:disable branch

        ActiveSupport.on_load(:action_controller) do
          self.view_paths = view_paths.reject do |view_path|
            view_path.path.to_s.starts_with?(Kaminari::Engine.root.to_s)
          end
        end
      end
    end
  end
end
