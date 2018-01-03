# frozen_string_literal: true
FactoryGirl.define do
  factory :talk_summary do
    body { '## Pants' }

    trait :just_pass_validation do
      submitted_at { Time.current }
    end
  end
end
