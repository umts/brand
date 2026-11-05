# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'umts/brand/_resource.html.haml' do
  before do
    render layout: 'umts/brand/resource', locals: do |resource|
      resource.heading heading
      resource.nav_items { nav_items }
      resource.body { body }
    end
  end

  context 'without nav items' do
    let(:locals) { nil }
    let(:heading) { 'Bare heading' }
    let(:nav_items) { nil }
    let(:body) { 'Bare content' }

    it 'renders successfully with the given content' do
      expect(rendered).to have_text('Bare heading').and(have_text('Bare content'))
    end
  end

  context 'with nav items' do
    let(:locals) { { nav_expand: 'sm' } }
    let(:heading) { 'Nav heading' }
    let(:nav_items) { <<~NAV_ITEMS.html_safe }
      <li class="nav-item">
        <a href="#">Nav link</a>
      </li>
    NAV_ITEMS
    let(:body) { 'Nav content' }

    it 'renders successfully with the given content' do
      expect(rendered).to have_text('Nav heading').and(have_link('Nav link')).and(have_text('Nav content'))
    end
  end
end
