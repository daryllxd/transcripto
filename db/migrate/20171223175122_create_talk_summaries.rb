# frozen_string_literal: true
class CreateTalkSummaries < ActiveRecord::Migration[5.1]
  def change
    create_table :talk_summaries do |t|
      t.string :title, null: false
      t.string :video_url, null: false
      t.string :body, null: false

      t.timestamps
    end

    add_reference(
      :talk_summaries, :created_by_user,
      index: true, null: false,
      foreign_key: { to_table: :users }
    )
  end
end
