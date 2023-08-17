require_relative 'book/addbook'
require_relative 'book/displaybook'
require_relative 'book/displaylabel'
require_relative 'games/add_game'
require_relative 'games/list_games'
require_relative 'games/list_authors'
require_relative 'book/load_book_label'
require_relative 'book/preservedata'
require_relative 'music/addmusic'
require_relative 'music/displaymusic'
require_relative 'music/displaygenre'
require_relative 'music/storage'

module Modules
  include AddBook
  include DisplayBook
  include DisplayLabel
  include AddGame
  include ListGames
  include ListAuthors
  include PreserveData
  include LoadData
  include AddMusic
  include DisplayMusic
  include DisplayGenres
  include Storage

  def save_collections
    save_book
    save_label
    save_music
    save_genres
  end

  def load_collections
    load_labels
    load_books
    load_genres
    load_music_albums
  end
end
