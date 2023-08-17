# # module AddMusic
# #   def add_music
# #     publish_date = input_date
# #     on_spotify = input_on_spotify
# #     music_album = MusicAlbum.new(publish_date, on_spotify)
# #     @music_albums << music_album
# #     genre = add_genre
# #     music_album.add_genre(genre)
# #     puts 'Music album Added Successfully'
# #   end

# module AddMusic

# def add_music
#   puts 'Adding a new music album:'
#   print 'Enter the publish date (YYYY/MM/DD): '
#   publish_date = gets.chomp
#   print 'Is the album on Spotify? (true/false): '
#   on_spotify = gets.chomp.downcase == 'true'

#   # Prompt the user for the genre name
#   print 'Enter the genre name: '
#   genre_name = gets.chomp

#   # Create a new Genre object with the input name
#   genre = Genre.new(name: genre_name)

#   # Create a new MusicAlbum object and add it to the collection
#   music_album = MusicAlbum.new(publish_date, on_spotify)
#   music_album.add_genre(genre)

#   @music_albums << music_album
#   puts 'Music album added!'
# end

#   def input_date
#     puts 'Please Enter publish date in the following format: yyyy/mm/dd'
#     gets.chomp
#   end

#   def add_genre
#     puts 'Add a genre'
#     puts 'Enter Genre Name'
#     input = gets.chomp
#     return_genre(input)
#   end

#   def return_genre(input)
#     @genres.each_with_index do |genre, _index|
#       return genre if genre.name == input
#     end
#     # new_genre = Genre.new(name: input)
#     genre = Genre.new(name: genre_name)

#     @genres << new_genre
#     new_genre
#   end

#   def input_on_spotify
#     puts 'Is the music album on Spotify? Press 1 for true, 2 for false'
#     on_spotify = gets.chomp.to_i
#     while on_spotify.nil? || on_spotify < 1 || on_spotify > 2
#       puts 'Input a number between 1 and 2'
#       on_spotify = gets.chomp.to_i
#     end

#     on_spotify == 1
#   end
# end

module AddMusic
  def add_music
    publish_date = input_date
    on_spotify = input_on_spotify
    music_album = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << music_album
    genre = add_genre
    music_album.add_genre(genre)
    puts 'Music album Added Successfully'
  end

  def input_date
    puts 'Please Enter publish date in following format: yyyy/mm/dd'
    gets.chomp
  end

  def add_genre
    puts 'Add a genre'
    puts 'Enter Genre Name'
    input = gets.chomp
    return_genre(input)
  end

  def return_genre(input)
    @genres.each_with_index do |genre, _index|
      return genre if genre.name == input
    end
    new_genre = Genre.new(name: input)
    @genres << new_genre
    new_genre
  end

  def input_on_spotify
    puts 'Is the music album on spotify? Press 1 for true, 2 for false'
    on_spotify = gets.chomp.to_i
    while on_spotify.nil? || on_spotify < 1 || on_spotify > 2
      puts 'input number between 1 and 2'
      on_spotify = gets.chomp.to_i
    end

    on_spotify == 1
  end
end
