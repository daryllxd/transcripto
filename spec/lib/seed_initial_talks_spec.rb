# frozen_string_literal: true

RSpec.describe MigrationScripts::SeedInitialTalks do
  it 'spec_name' do
    _alice = create(:user)

    described_class.new.seed

    expect(TalkSummary.count).to eq(1)
    expect(Talk.first.video_url).to eq('https://www.youtube.com/watch?v=URSWYvyc42M')
  end
end
