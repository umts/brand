# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'kaminari/_paginator.html.haml' do
  let(:items) { Kaminari.paginate_array(Array.new(500) { |n| "Item #{n + 1}" }).page(page) }

  before do
    controller.request.path_parameters.merge!(controller: 'demos', action: 'index')
    assign(:items, items)
    render inline: '<%= paginate @items %>' # rubocop:disable Rails/RenderInline
  end

  context 'when on first page' do
    let(:page) { 1 }

    it 'renders successfully' do
      expect(rendered).to be_present
    end
  end

  context 'when on last page' do
    let(:page) { 10 }

    it 'renders successfully' do
      expect(rendered).to be_present
    end
  end
end
