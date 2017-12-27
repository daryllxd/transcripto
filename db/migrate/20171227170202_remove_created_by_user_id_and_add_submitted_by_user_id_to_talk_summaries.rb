# frozen_string_literal: true
class RemoveCreatedByUserIdAndAddSubmittedByUserIdToTalkSummaries < ActiveRecord::Migration[5.1]
  def change
    remove_column :talk_summaries, :created_by_user_id

    add_reference(
      :talk_summaries, :submitted_by_user,
      index: true, null: false,
      foreign_key: { to_table: :users }
    )
  end
end
