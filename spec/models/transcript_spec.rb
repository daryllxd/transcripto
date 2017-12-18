# frozen_string_literal: true

RSpec.describe Transcript, type: :model do
  # Validations
  it  { should validate_presence_of(:title) }
  it  { should validate_presence_of(:video_url) }
  it  { should validate_presence_of(:body) }
end
