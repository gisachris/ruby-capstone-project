 require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify
  attr_accessor :genres

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
    @genres = []
  end

  def add_genre(genre)
    @genres << genre unless genre.nil?
  end

  def can_be_archived?
    super && @on_spotify == true
  end

  def to_hash
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify,
      'genres' => @genres.compact.map(&:to_hash)
    }
  end
end
