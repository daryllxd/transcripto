# frozen_string_literal: true

class TalkSummary < ApplicationRecord
  validates :title, presence: true
  validates :video_url, presence: true
  validates :body, presence: true

  belongs_to :created_by_user, class_name: User
end
