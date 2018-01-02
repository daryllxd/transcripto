# frozen_string_literal: true
FactoryGirl.define do
  factory :talk do
    video_url { 'Pants' }
    title { 'Pants' }
    presenter { 'Pants McPants' }
    event { 'PantsConf' }
  end
end
