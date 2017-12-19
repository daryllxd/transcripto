# frozen_string_literal: true
RSpec.describe Transcripts::CreateService, type: :service do
  context 'happy path' do
    it 'works' do
      alice = create(:user)

      new_transcript_attributes = {
        created_by_user: alice,
        title: 'Atlantis',
        video_url: 'youtube.com/atlantis',
        body: <<~SENTINEL
          ## Hello
          Atlantis
        SENTINEL
      }

      created_transcript = execute.call(new_transcript_attributes)

      expect(created_transcript).to be_valid
      expect(created_transcript.created_by_user).to eq(alice)
    end
  end

  context 'errors' do
    it 'raises an error' do
      bad_new_transcript_attributes = {
        created_by_user: nil,
        title: nil,
        video_url: 'youtube.com/atlantis',
        body: <<~SENTINEL
          ## Hello
          Atlantis
        SENTINEL
      }

      expect { execute.call(bad_new_transcript_attributes) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
