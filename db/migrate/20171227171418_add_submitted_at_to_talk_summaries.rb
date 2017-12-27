# frozen_string_literal: true
class AddSubmittedAtToTalkSummaries < ActiveRecord::Migration[5.1]
  def change
    add_column :talk_summaries, :submitted_at, :datetime

    TalkSummary.update_all(submitted_at: Time.current)

    change_column_null(:talk_summaries, :submitted_at, false)
  end
end
