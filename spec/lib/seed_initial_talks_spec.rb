# frozen_string_literal: true

RSpec.describe SeedInitialTalks do
  it 'spec_name' do
    _alice = create(:user)

    SeedInitialTalks.new.seed

    expect(TalkSummary.count).to eq(1)
  end
end
