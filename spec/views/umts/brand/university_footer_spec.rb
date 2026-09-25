# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'umts/brand/_university_footer.html.haml' do
  subject(:call) { render(partial: 'umts/brand/university_footer') }

  context 'without university trademark authorization' do
    before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: false) }

    it 'raises an error' do
      expect { call }.to raise_error(String)
    end
  end

  context 'with university trademark authorization' do
    before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: true) }

    it 'renders with university branding' do
      call
      expect(rendered).to have_text('University of Massachusetts Amherst')
    end
  end
end
