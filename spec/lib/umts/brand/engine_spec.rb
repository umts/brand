# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UMTS::Brand::Engine do
  it 'adds the fontawesome font directory to the application asset paths' do
    expect(Rails.application.config.assets.paths).to include(
      Rails.root.join('node_modules/@fortawesome/fontawesome-free/webfonts')
    )
  end

  it 'adds the public sans font directory to the application asset paths' do
    expect(Rails.application.config.assets.paths).to include(
      Rails.root.join('node_modules/@fontsource/public-sans/files')
    )
  end
end
