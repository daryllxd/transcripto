# frozen_string_literal: true
class RemoveTitleAndVideoUrlFromTalkSummaries < ActiveRecord::Migration[5.1]
  def change
    remove_column :talk_summaries, :title
    remove_column :talk_summaries, :video_url
  end
end
