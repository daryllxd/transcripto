# frozen_string_literal: true

RSpec.describe Talk, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:video_url) }
  it { should validate_presence_of(:presenter) }
  it { should validate_presence_of(:event) }

  context '#youtube_embed_url' do
    it 'gets the embed URL if the video is on Youtube' do
      talk = create(:talk, video_url: 'https://www.youtube.com/watch?v=URSWYvyc42M')

      expect(talk.youtube_embed_url).to eq 'https://www.youtube.com/embed/URSWYvyc42M'
    end
  end
end
