# frozen_string_literal: true
FactoryGirl.define do
  factory :activity_tag do
    trait :programming do
      name { 'Programming' }
      shortcut { 'p' }
    end

    trait :transcripto do
      name { 'Transcripto' }
      shortcut { 'd' }
    end
  end
end
