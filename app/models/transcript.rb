# frozen_string_literal: true
# == Schema Information
#
# Table name: transcripts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  video_url  :string           not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transcript < ApplicationRecord
  validates :title, presence: true
  validates :video_url, presence: true
  validates :body, presence: true
end
