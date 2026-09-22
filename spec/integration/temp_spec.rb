# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  before { visit root_path }

  it 'renders a home page' do
    expect(page).to have_text('Home')
  end
end
