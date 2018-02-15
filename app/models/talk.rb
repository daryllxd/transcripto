# frozen_string_literal: true
# == Schema Information
#
# Table name: talks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  video_url  :string           not null
#  presenter  :string           not null
#  event      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Talk < ApplicationRecord
  validates :title, presence: true
  validates :video_url, presence: true
  validates :presenter, presence: true
  validates :event, presence: true

  def youtube_embed_url
    video_url.gsub(/watch\?v=/, 'embed/')
  end
end
