# frozen_string_literal: true
class PagesController < ApplicationController
  include HighVoltage::StaticPage

  # Order actually matters, this has to be after include HighVoltage::StaticPage
  layout :layout_for_page

  def index
    @talk_summaries = TalkSummary.all
    @featured_talk_summary = TalkSummary.last || NullTalkSummary.new
    redirect_to dashboard_path if user_signed_in?
  end

  private

  def layout_for_page
    case params[:action]
    when 'index'
      'home'
    else
      'application'
    end
  end
end
