# frozen_string_literal: true
# == Schema Information
#
# Table name: talk_summaries
#
#  id                   :integer          not null, primary key
#  title                :string           not null
#  video_url            :string           not null
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
  validates :title, presence: true
  validates :video_url, presence: true
  validates :body, presence: true

  belongs_to :submitted_by_user, class_name: 'User'
  belongs_to :talk
end
