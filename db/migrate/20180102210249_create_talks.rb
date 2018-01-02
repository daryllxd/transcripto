# frozen_string_literal: true
class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.string :title, null: false
      t.string :video_url, null: false
      t.string :presenter, null: false
      t.string :event, null: false

      t.timestamps
    end
  end
end
