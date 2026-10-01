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

  it 'configures kaminari' do
    expect(Kaminari.config).to have_attributes(default_per_page: 50, window: 3, outer_window: 1)
  end

  it 'removes default kaminari view paths' do
    paths = ActionController::Base.view_paths.collect { |view_path| view_path.path.to_s }
    expect(paths).not_to include(a_string_matching(/kaminari/))
  end

  it 'configures error pages' do
    expect(Rails.application.config.exceptions_app).to eq(Rails.application.routes)
  end
end
