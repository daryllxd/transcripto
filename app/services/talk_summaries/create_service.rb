# frozen_string_literal: true
module TalkSummaries
  class CreateService
    attr_reader :created_by_user, :title, :video_url, :body

    def initialize(created_by_user:, title:, video_url:, body:)
      @created_by_user = created_by_user
      @title = title
      @video_url = video_url
      @body = body
    end

    def call
      TalkSummary.create!(
        created_by_user: created_by_user,
        title: title,
        video_url: video_url,
        body: body
      )
    end
  end
end
