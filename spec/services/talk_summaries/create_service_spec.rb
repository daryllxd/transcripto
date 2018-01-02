# frozen_string_literal: true
RSpec.describe TalkSummaries::CreateService, type: :service do
  context 'happy path' do
    it 'works' do
      alice = create(:user, :alice)
      talk = create(:talk)

      new_talk_summary_attributes = {
        submitted_by_user: alice,
        talk: talk,
        title: 'Atlantis',
        video_url: 'youtube.com/atlantis',
        body: <<~SENTINEL
          ## Hello
          Atlantis
        SENTINEL
      }

      created_talk_summary = execute.call(new_talk_summary_attributes)

      expect(created_talk_summary).to be_valid
      expect(created_talk_summary.submitted_by_user).to eq(alice)
    end
  end

  context 'errors' do
    it 'returns invalid' do
      bad_new_talk_summary_attributes = {
        submitted_by_user: nil,
        talk: nil,
        title: nil,
        video_url: 'youtube.com/atlantis',
        body: <<~SENTINEL
          ## Hello
          Atlantis
        SENTINEL
      }

      invalid_talk_summary = execute.call(bad_new_talk_summary_attributes)

      expect(invalid_talk_summary).not_to be_valid
    end
  end
end
