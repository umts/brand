# frozen_string_literal: true

Rails.application.configure do
  config.after_initialize do
    config.assets.paths << Rails.root.join('../../node_modules/@fontsource/public-sans/files')
  end
end
