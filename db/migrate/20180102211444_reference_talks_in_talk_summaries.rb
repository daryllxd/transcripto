# frozen_string_literal: true
class ReferenceTalksInTalkSummaries < ActiveRecord::Migration[5.1]
  def change
    add_reference(
      :talk_summaries, :talk,
      index: true, null: false,
      foreign_key: { to_table: :talks }
    )
  end
end
