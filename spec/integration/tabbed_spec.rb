# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'umts/brand/_tabbed.html.haml', type: :view do
  before { render(layout: 'umts/brand/tabbed', locals:) { content } }

  context 'without nav items' do
    let(:locals) { { heading: 'Bare heading' } }
    let(:content) { 'Bare content' }

    it 'renders successfully with the given content' do
      expect(rendered).to have_text('Bare heading').and(have_text('Bare content'))
    end
  end

  context 'with nav items' do
    let(:locals) { { heading: 'Nav heading', nav_items: <<~NAV_ITEMS.html_safe } }
      <li class="nav-item">
        <a href="#">Nav link</a>
      </li>
    NAV_ITEMS
    let(:content) { 'Nav content' }

    it 'renders successfully with the given content' do
      expect(rendered).to have_text('Nav heading').and(have_link('Nav link')).and(have_text('Nav content'))
    end
  end
end
