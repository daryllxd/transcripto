# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:email) { |x| "user#{x}@email.com" }
    password 'password'

    trait :alice do
      sequence(:email) { |x| "alice#{x}@email.com" }
    end
  end
end
