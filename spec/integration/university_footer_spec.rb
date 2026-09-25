# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'umts/brand/_university_footer.html.haml', type: :view do
  before { render(partial: 'umts/brand/university_footer', locals:) }

  context 'without university trademark authorization' do
    let(:locals) { { university_trademarks: false } }

    it 'renders nothing' do
      expect(rendered).to be_blank
    end
  end

  context 'with university trademark authorization' do
    let(:locals) { { university_trademarks: true } }

    it 'renders with university branding' do
      expect(rendered).to have_text('University of Massachusetts Amherst')
    end
  end
end
