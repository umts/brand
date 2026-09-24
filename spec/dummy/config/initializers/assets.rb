# frozen_string_literal: true

Rails.application.configure do
  config.after_initialize do
    # due to nesting, dummy app needs redundant asset path additions
    config.assets.paths << Rails.root.join('../../node_modules/@fontsource/public-sans/files')
  end
end
