# frozen_string_literal: true
module TalkSummaries
  class CreateService
    attr_reader :submitted_by_user, :title, :video_url, :body

    def initialize(submitted_by_user:, title:, video_url:, body:)
      @submitted_by_user = submitted_by_user
      @title = title
      @video_url = video_url
      @body = body
    end

    def call
      TalkSummary.create(
        submitted_by_user: submitted_by_user,
        title: title,
        video_url: video_url,
        body: body
      )
    end
  end
end
