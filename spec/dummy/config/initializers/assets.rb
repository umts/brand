# frozen_string_literal: true

Rails.application.configure do
  config.after_initialize do
    config.assets.paths << Rails.root.join('../../node_modules/@fontsource/public-sans/files')
    config.assets.paths << Rails.root.join('../../node_modules/@fortawesome/fontawesome-free/webfonts')
  end
end
