# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/umts/brand/mailer.html.haml' do
  subject(:call) do
    render inline: 'Hello, Mailer.', layout: 'layouts/umts/brand/mailer' # rubocop:disable Rails/RenderInline
  end

  context 'without university trademark authorization' do
    before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: false) }

    it 'raises an error' do
      expect { call }.to raise_error(String)
    end
  end

  context 'with university trademark authorization' do
    before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: true) }

    it 'renders successfully' do
      call
      expect(rendered).to have_text('Hello, Mailer.')
    end
  end
end
