# frozen_string_literal: true
FactoryGirl.define do
  factory :talk_summary do
    video_url { 'Pants' }
    title { 'Pants' }
    body { '## Pants' }
  end
end
