# frozen_string_literal: true
class DropTranscripts < ActiveRecord::Migration[5.1]
  def change
    drop_table :transcripts
  end
end
