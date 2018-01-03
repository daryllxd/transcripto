# frozen_string_literal: true
module YoutubeApi
  class Video
    extend Memoist

    attr_reader :url

    delegate :title, :description, :published_at, :channel_id, :channel_title,
             :license, :licensed_as_creative_commons?, :licensed_as_standard_youtube?, to: :found_video

    def initialize(url:)
      @url = url
    end

    def find
      found_video
    end

    private

    def found_video
      found_video = Yt::Video.new(id: trim_url)
      # Hard to see if a video was actually found
      # Check if the video actually exists by trying to get the title
      # The title gets memoized anyway
      found_video.title

      found_video
    rescue Yt::Errors::NoItems
      YoutubeApi::Error.new(trim_url)
    end

    def trim_url
      trim_out = %r{^http(s)?:\/\/www.youtube.com\/watch\?v=}
      url.gsub(trim_out, '')
    end

    memoize :found_video
  end
end
