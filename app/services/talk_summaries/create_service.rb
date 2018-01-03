# frozen_string_literal: true
module TalkSummaries
  class CreateService
    attr_reader :submitted_by_user, :talk, :body

    def initialize(submitted_by_user:, talk:, body:)
      @submitted_by_user = submitted_by_user
      @talk = talk
      @body = body
    end

    def call
      TalkSummary.create(
        submitted_by_user: submitted_by_user,
        talk: talk,
        body: body,
        submitted_at: Time.current
      )
    end
  end
end
