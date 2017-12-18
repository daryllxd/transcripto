# frozen_string_literal: true
RSpec.describe Transcripts::CreateService, type: :service do
  context 'happy path' do
    it 'works' do
      new_transcript_attributes = {
        title: 'Atlantis',
        video_url: 'youtube.com/atlantis',
        body: <<~EOF
          ## Hello
          Atlantis
        EOF
      }

      created_transcript = execute.call(new_transcript_attributes)

      expect(created_transcript).to be_valid
    end
  end

  context 'errors' do
    it 'raises an error' do
      bad_new_transcript_attributes = {
        title: nil,
        video_url: 'youtube.com/atlantis',
        body: <<~EOF
          ## Hello
          Atlantis
        EOF
      }

      expect { execute.call(bad_new_transcript_attributes) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
