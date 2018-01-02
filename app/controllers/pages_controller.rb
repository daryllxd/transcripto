# frozen_string_literal: true
class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def index
    @talk_summaries = TalkSummary.all
    @featured_talk_summary = TalkSummary.last
    redirect_to dashboard_path if user_signed_in?
  end
end
