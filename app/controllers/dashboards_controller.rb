# frozen_string_literal: true
class DashboardsController < ApplicationController
  def show
    @talk_summaries = current_user.submitted_talk_summaries
  end
end
