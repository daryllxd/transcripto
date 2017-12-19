# frozen_string_literal: true
class AddCreatedByUserToTranscript < ActiveRecord::Migration[5.1]
  def change
    add_reference(
      :transcripts, :created_by_user,
      index: true, null: false,
      foreign_key: { to_table: :users }
    )
  end
end
