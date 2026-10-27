# frozen_string_literal: true

require 'active_support'
require 'active_support/lazy_load_hooks'

module UMTS
  module Brand
    module CoreExt
      module ActionController
        module Base
          def flash_success_for(subject, action = action_name) = flash_success(flash, subject, action)

          def flash_success_now_for(subject, action = action_name) = flash_success(flash.now, subject, action)

          def flash_errors_for(subject) = flash_errors(flash, subject)

          def flash_errors_now_for(subject) = flash_errors(flash.now, subject)

          private

          def flash_success(flash, subject, action)
            action = t('.performed', default: [:"performed.#{action}", :"umts.brand.flash.performed.#{action}"])
            subject = subject.model_name.human.downcase if subject.respond_to?(:model_name)
            flash[:notice] = t('umts.brand.flash.success', action:, subject:)
          end

          def flash_errors(flash, subject)
            flash[:alert] = subject.errors.full_messages.to_sentence
          end
        end
      end
    end
  end
end

ActiveSupport.on_load(:action_controller) { include UMTS::Brand::CoreExt::ActionController::Base }
