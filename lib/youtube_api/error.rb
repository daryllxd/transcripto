# frozen_string_literal: true
module YoutubeApi
  class Error < StandardError
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def valid?
      false
    end

    def to_s
      "Video not found: #{url}"
    end
  end
end
