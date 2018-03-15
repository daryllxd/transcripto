# frozen_string_literal: true
class TalkSummariesController < ApplicationController
  def create
    @talk_summary = TalkSummaries::CreateService.new(
      permitted_create_params.to_h.merge(submitted_by_user: current_user).symbolize_keys
    ).call

    if @talk_summary.valid?
      flash[:notice] = 'Summary created!'
    else
      flash[:error] = 'Something went wrong.'
    end

    redirect_to dashboard_path
  end

  def index
    @talk_summaries = TalkSummary.includes(:talk).all
  end

  def show
    @talk_summary = TalkSummary.find(params[:id])
  end

  private

  def permitted_create_params
    params.require(:talk_summary).permit(
      :video_url,
      :title,
      :body
    )
  end
end
