# frozen_string_literal: true
# == Schema Information
#
# Table name: transcripts
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  video_url          :string           not null
#  body               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  created_by_user_id :integer          not null
#
# Indexes
#
#  index_transcripts_on_created_by_user_id  (created_by_user_id)
#
# Foreign Keys
#
#  fk_rails_17948d5588  (created_by_user_id => users.id)
#

class Transcript < ApplicationRecord
  validates :title, presence: true
  validates :video_url, presence: true
  validates :body, presence: true

  belongs_to :created_by_user, class_name: User
end
