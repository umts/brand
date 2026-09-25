# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UMTS::Brand::FaviconHelper do
  describe '#umts_brand_favicons' do
    subject(:call) { helper.umts_brand_favicons }

    context 'without university trademark authorization' do
      before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: false) }

      it 'raises an error' do
        expect { call }.to raise_error(String)
      end
    end

    context 'with university trademark authorization' do
      before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: true) }

      it 'renders favicon links' do
        expect(call).to include('<link rel="icon" type="image/png"')
          .and(include('<link rel="icon" type="image/svg+xml"'))
          .and(include('<link rel="apple-touch-icon"'))
      end
    end
  end
end
