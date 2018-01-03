# frozen_string_literal: true
RSpec.describe YoutubeApi::Video do
  context '#video' do
    context 'video found' do
      it 'can call methods on the found video' do
        # TODO: Add VCR
        url = 'https://www.youtube.com/watch?v=URSWYvyc42M'
        found_video = described_class.new(url: url).find
        expect(found_video.title).not_to be_nil
        expect(found_video.description).not_to be_nil
      end
    end

    context 'no video found' do
      it 'returns an error' do
        url = 'https://www.youtube.com/watch?v=this_doesnt_exist_bro'
        found_video = described_class.new(url: url).find
        expect(found_video).not_to be_valid
        expect(found_video.to_s).not_to be_nil
      end
    end
  end
end
