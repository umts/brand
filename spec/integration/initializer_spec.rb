# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Initializer' do
  it 'adds the public sans font directory to the application asset paths' do
    expect(Rails.application.config.assets.paths).to include(
      Rails.root.join('node_modules/@fontsource/public-sans/files')
    )
  end
end
