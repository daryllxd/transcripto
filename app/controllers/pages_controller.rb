# frozen_string_literal: true
class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def index
    redirect_to dashboard_path if user_signed_in?
  end
end
