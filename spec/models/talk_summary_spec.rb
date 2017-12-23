# frozen_string_literal: true

RSpec.describe TalkSummary, type: :model do
  # Validations
  it  { should validate_presence_of(:title) }
  it  { should validate_presence_of(:video_url) }

  # Associations
  it  { should belong_to(:created_by_user) }
end
