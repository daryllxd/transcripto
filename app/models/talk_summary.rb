# frozen_string_literal: true
# == Schema Information
#
# Table name: talk_summaries
#
#  id                   :integer          not null, primary key
#  body                 :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  submitted_by_user_id :integer          not null
#  submitted_at         :datetime         not null
#  talk_id              :integer          not null
#
# Indexes
#
#  index_talk_summaries_on_submitted_by_user_id  (submitted_by_user_id)
#  index_talk_summaries_on_talk_id               (talk_id)
#
# Foreign Keys
#
#  fk_rails_2fd0d122c7  (talk_id => talks.id)
#  fk_rails_5220d05fed  (submitted_by_user_id => users.id)
#

class TalkSummary < ApplicationRecord
  validates :body, presence: true
  validates :submitted_at, presence: true

  belongs_to :submitted_by_user, class_name: 'User'
  belongs_to :talk

  delegate :title, :presenter, :event, :youtube_embed_url, to: :talk
end
