# frozen_string_literal: true

require 'umts/brand'

RSpec.describe UMTS::Brand do
  it 'has a version number' do
    expect(UMTS::Brand::VERSION).not_to be_nil
  end
end
