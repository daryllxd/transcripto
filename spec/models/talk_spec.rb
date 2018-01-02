# frozen_string_literal: true

RSpec.describe Talk, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:video_url) }
  it { should validate_presence_of(:presenter) }
  it { should validate_presence_of(:event) }
end
