# frozen_string_literal: true
class CreateTranscripts < ActiveRecord::Migration[5.0]
  def change
    create_table :transcripts do |t|
      t.string :title, null: false
      t.string :video_url, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
