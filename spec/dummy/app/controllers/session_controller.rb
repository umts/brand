# frozen_string_literal: true

class SessionController < ApplicationController
  def toggle_layout
    session[:toggle_layout] = !session[:toggle_layout]
    redirect_back_or_to root_path
  end

  def toggle_flash
    session[:toggle_flash] = !session[:toggle_flash]
    redirect_back_or_to root_path
  end
end
