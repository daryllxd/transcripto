# frozen_string_literal: true

RSpec.describe TalkSummary, type: :model do
  # Validations
  it  { should validate_presence_of(:body) }
  it  { should validate_presence_of(:submitted_at) }

  # Associations
  it  { should belong_to(:submitted_by_user) }
  it  { should belong_to(:talk) }
end
