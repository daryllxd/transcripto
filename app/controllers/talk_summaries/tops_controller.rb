# frozen_string_literal: true
module TalkSummaries
  class TopsController < ApplicationController
    def show
      @top_talks = [
        {
          title: 'Rails Conf 2017: Keynote',
          speaker: 'Aaron Patterson',
          summary: 'Aaron talks about Rails.',
          tags: %w[cats dogs]
        },
        {
          title: 'Rails Conf 2017: Opening Keynote',
          speaker: 'David Heinemeier Hansson',
          summary: 'DHH talks about Rails.',
          tags: %w[cats dogs]
        }
      ]

      render 'talk_summaries/top'
    end
  end
end
