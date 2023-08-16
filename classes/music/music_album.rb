# require_relative '../item'
# class MusicAlbum < Item
#   attr_reader :on_spotify

#   def initialize(publish_date, on_spotify)
#     super(publish_date)
#     @on_spotify = on_spotify
#     @genres = []
#   end

#   def can_be_archived?
#     super && @on_spotify == true
#   end
# end

class MusicAlbum < Item
  attr_reader :on_spotify
  attr_accessor :genres

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
    @genres = [] # Initialize an empty array for genres
  end

  def add_genre(genre)
    @genres << genre
  end

  def can_be_archived?
    super && @on_spotify == true
  end
end
