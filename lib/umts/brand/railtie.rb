# frozen_string_literal: true

require 'rails'

module UMTS
  module Brand
    class Railtie < ::Rails::Railtie
      initializer 'umts-brand.asset' do
        Rails.application.config.assets.paths << Rails.root.join('node_modules/@fontsource/public-sans/files')
      end
    end
  end
end
