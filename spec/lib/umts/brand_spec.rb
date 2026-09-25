# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UMTS::Brand do
  describe '#use_university_trademarks!' do
    subject(:call) { described_class.use_university_trademarks! }

    around do |example|
      previous_paths = Rails.application.config.assets.paths
      previous_precompile = Rails.application.config.assets.precompile
      Rails.application.config.assets.paths = []
      Rails.application.config.assets.precompile = []
      example.run
      Rails.application.config.assets.paths = previous_paths
      Rails.application.config.assets.precompile = previous_precompile
    end

    it 'adds the trademark directory to the application asset paths' do
      call
      expect(Rails.application.config.assets.paths.collect(&:to_s)).to include(matching(/trademarks/))
    end

    it 'adds the trademark assets to the application asset precompile list' do
      call
      expect(Rails.application.config.assets.precompile.collect(&:to_s)).to include(matching(/trademarks/))
    end
  end
end
