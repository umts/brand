# frozen_string_literal: true

class DemosController < ApplicationController
  def index
    @feature = params[:feature]
  end
end
