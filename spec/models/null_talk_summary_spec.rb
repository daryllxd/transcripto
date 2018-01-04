# frozen_string_literal: true

RSpec.describe NullTalkSummary, type: :model do
  it 'behaves like a null object' do
    null_talk_summary = described_class.new

    expect(null_talk_summary.title).to be_present
    expect(null_talk_summary.body).to be_present
  end
end
