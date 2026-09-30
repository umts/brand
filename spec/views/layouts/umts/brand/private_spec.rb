# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/umts/brand/private.html.haml' do
  subject(:call) do
    render inline: 'Hello, Application', layout: 'layouts/umts/brand/private' # rubocop:disable Rails/RenderInline
  end

  let(:trademark_authorization) { true }

  before do
    allow(UMTS::Brand).to receive(:using_university_trademarks).and_return(trademark_authorization)
    controller.prepend_view_path UMTS::Brand::Engine.root.join('app/views/application')
  end

  context 'without university trademark authorization' do
    let(:trademark_authorization) { false }

    it 'raises an error' do
      expect { call }.to raise_error(String)
    end
  end

  context 'with university trademark authorization' do
    it 'renders successfully' do
      call
      expect(rendered).to have_text('Hello, Application')
    end
  end

  context 'with title content' do
    before { view.content_for(:title) { 'Hello, Title' } }

    it 'renders successfully' do
      call
      expect(rendered).to have_text('Hello, Application').and(have_text('Hello, Title'))
    end
  end

  context 'with flash messages' do
    before do
      controller.flash[:alert] = 'Hello, Alert'
      controller.flash[:notice] = 'Hello, Notice'
    end

    it 'renders successfully' do
      call
      expect(rendered).to have_text('Hello, Application').and(have_text('Hello, Alert')).and(have_text('Hello, Notice'))
    end
  end

  context 'with a flash partial override' do
    before { stub_template '_flash.html.haml' => 'Hello, Flash' }

    it 'renders successfully' do
      call
      expect(rendered).to have_text('Hello, Application').and(have_text('Hello, Flash'))
    end
  end

  context 'with a navbar partial override' do
    before { stub_template '_navbar.html.haml' => 'Hello, Navbar' }

    it 'renders successfully' do
      call
      expect(rendered).to have_text('Hello, Application').and(have_text('Hello, Navbar'))
    end
  end
end
