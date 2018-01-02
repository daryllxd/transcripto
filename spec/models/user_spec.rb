# frozen_string_literal: true

RSpec.describe User, type: :model do
  it { should have_many(:submitted_talk_summaries) }

  context 'queries' do
    it 'talk_summaries' do
      alice = create(:user)
      talk = create(:talk)
      talk_summary = create(
        :talk_summary, :just_pass_validation,
        talk: talk, submitted_by_user: alice
      )

      expect(alice.submitted_talk_summaries).to match_array(
        [talk_summary]
      )
    end
  end
end
