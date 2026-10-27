# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UMTS::Brand::CoreExt::ActionController::Base do
  let(:controller) { controller_class.new }
  let(:controller_class) do
    Class.new(ActionController::Base) do # rubocop:disable Rails/ApplicationController
      def self.name = 'FakeController'
    end
  end
  let(:flash) { ActionDispatch::Flash::FlashHash.new }

  before do
    controller.action_name = 'create'
    allow(controller).to receive(:flash).and_return(flash)
  end

  it 'is included in every controller' do
    expect(ActionController::Base.ancestors).to include(described_class)
  end

  describe '#flash_success_for' do
    context 'with a model subject and no explicit action' do
      before { controller.flash_success_for(Demo.new) }

      it 'sets a notice describing the current action and the humanized model name' do
        expect(flash[:notice]).to eq('Successfully created demo')
      end

      it 'keeps the notice for the next request' do
        expect(flash.to_session_value).to be_present
      end
    end

    context 'with a non model subject and an explicit action' do
      before { controller.flash_success_for('your preferences', :update) }

      it 'sets a notice describing the given action and subject' do
        expect(flash[:notice]).to eq('Successfully updated your preferences')
      end
    end

    context 'with a controller specific action translation' do
      before do
        I18n.backend.store_translations(:en, fake: { create: { performed: 'onboarded' } })
        controller.flash_success_for(Demo.new)
      end

      after { I18n.backend.reload! }

      it 'prefers the controller specific translation' do
        expect(flash[:notice]).to eq('Successfully onboarded demo')
      end
    end

    context 'with an application wide action translation' do
      before do
        I18n.backend.store_translations(:en, performed: { create: 'registered' })
        controller.flash_success_for(Demo.new)
      end

      after { I18n.backend.reload! }

      it 'prefers the application wide translation over the gem default' do
        expect(flash[:notice]).to eq('Successfully registered demo')
      end
    end

    context 'with an action that has no translation' do
      before { controller.flash_success_for(Demo.new, :frobnicate) }

      it 'reports the missing translation' do
        expect(flash[:notice]).to match(/translation missing/i)
      end
    end
  end

  describe '#flash_success_now_for' do
    before { controller.flash_success_now_for(Demo.new, :destroy) }

    it 'sets a notice describing the given action and subject' do
      expect(flash[:notice]).to eq('Successfully deleted demo')
    end

    it 'does not keep the notice for the next request' do
      expect(flash.to_session_value).to be_nil
    end
  end

  describe '#flash_errors_for' do
    context 'with an invalid subject' do
      before { controller.flash_errors_for(invalid_demo) }

      let(:invalid_demo) do
        Demo.new.tap do |demo|
          demo.validate
          demo.errors.add(:base, 'Something else went wrong')
        end
      end

      it 'sets an alert listing every error message' do
        expect(flash[:alert]).to eq("Field can't be blank and Something else went wrong")
      end

      it 'keeps the alert for the next request' do
        expect(flash.to_session_value).to be_present
      end
    end

    context 'with a valid subject' do
      before { controller.flash_errors_for(Demo.new) }

      it 'sets a blank alert' do
        expect(flash[:alert]).to be_blank
      end
    end
  end

  describe '#flash_errors_now_for' do
    before { controller.flash_errors_now_for(Demo.new.tap(&:validate)) }

    it 'sets an alert listing every error message' do
      expect(flash[:alert]).to eq("Field can't be blank")
    end

    it 'does not keep the alert for the next request' do
      expect(flash.to_session_value).to be_nil
    end
  end
end
