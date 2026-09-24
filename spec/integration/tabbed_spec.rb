# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tabbed layout', type: :system do
  before { visit tabbed_integrations_path }

  it 'renders without nav items' do
    expect(page).to have_text('Bare heading').and(have_text('Bare content'))
  end

  it 'renders with nav items' do
    expect(page).to have_text('Nav heading').and(have_link('Nav link')).and(have_text('Nav content'))
  end
end
