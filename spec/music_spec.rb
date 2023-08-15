require_relative '../classes/music/music_album'

describe 'Testing MusicAlbum class' do
  before(:context) do
    # (publish_date, on_spotify)
    @musicalbum = MusicAlbum.new('2023-07-12', true)
  end

  context 'Testing  MusicAlbum instance and Method' do
    it 'Testing on spotify instance' do
      expect(@musicalbum.on_spotify).to be true
    end

    it 'Testing publish Date instance' do
      expect(@musicalbum.publish_date).to eq '2023-07-12'
    end

    it 'Testing MusicAlbum class inheritance' do
      expect(MusicAlbum).to be < Item
    end
  end
end
