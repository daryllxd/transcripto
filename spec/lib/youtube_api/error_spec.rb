# frozen_string_literal: true
RSpec.describe YoutubeApi::Error do
  it 'acts like an error' do
    youtube_api_error = described_class.new('pants')

    expect(youtube_api_error).not_to be_valid
    expect(youtube_api_error.to_s).to eq 'Video not found: pants'
  end
end
