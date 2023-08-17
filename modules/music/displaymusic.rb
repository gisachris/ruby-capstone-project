module DisplayMusic
  def display_all_music_albums
    @music_albums.each_with_index do |music, index|
      genre_names = music.genres.empty? ? 'N/A' : music.genres.map { |genre| genre.name }.join(', ')
      puts "#{index}) on_Spotify: #{music.on_spotify}, Publish Date: #{music.publish_date}, Genres: #{genre_names}"
    end
  end
end

