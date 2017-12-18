# frozen_string_literal: true
module Transcripts
  class CreateService
    attr_reader :title, :video_url, :body

    def initialize(title:, video_url:, body:)
      @title = title
      @video_url = video_url
      @body = body
    end

    def call
      Transcript.create!(
        title: title,
        video_url: video_url,
        body: body
      )
    end
  end
end
