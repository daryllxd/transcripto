# frozen_string_literal: true
FactoryGirl.define do
  factory :talk_summary do
    video_url { 'Pants' }
    title { 'Pants' }
    body { '## Pants' }

    trait :just_pass_validation do
      submitted_at { Time.current }
    end
  end
end
