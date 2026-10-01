# frozen_string_literal: true

module UMTS
  module Brand
    class ErrorsController < Brand.errors_parent_controller.constantize
      def show
        @code = params[:code]
        @name = Rack::Utils::HTTP_STATUS_CODES[@code]
        @description = t(".#{@code}", default: nil)
      end
    end
  end
end
