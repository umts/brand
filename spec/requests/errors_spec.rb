# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Errors' do
  describe 'GET /:code' do
    subject(:call) { get "/#{code}" }

    context 'with an error code that has a description translation' do
      let(:code) { '400' }

      it 'responds successfully' do
        call
        expect(response).to be_successful
      end
    end

    context 'with an error code that does not have a description translation' do
      let(:code) { '405' }

      it 'responds successfully' do
        call
        expect(response).to be_successful
      end
    end
  end
end
