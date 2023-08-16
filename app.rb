require_relative 'classes/book/book'
require_relative 'classes/book/label'
require_relative 'modules/modules'
require_relative 'classes/game/author'
require_relative 'classes/game/game'
require_relative 'classes/game/game_author_storage'
require_relative 'classes/music/genre'
require_relative 'classes/music/music_album'

class App
  attr_accessor :books, :label

  include Modules
  include AddMusic
  include DisplayGenres


  def initialize
    @game_store = GameAuthorStorage.new
    @game_store.read_from_storage
    @books = []
    @label = []
    @genres = []
    @music_albums = []
    @authors_list = Author.all_authors
    @games_list = Game.all_games
    load_collections
  end

  def run(options)
    case options
    when 1
      display_books
    when 2
      display_all_music_albums
    when 3
      list_all_games
    when 4
      display_labels
    when 5
      list_all_authors
    when 6
      list_all_sources
    when 7
      display_all_genres
    when 8
      add_book
    when 9
      add_music
    when 10
      add_new_game
    else
      puts 'Thank you for using this app!'
      store_games
      save_and_exit
    end
  end

  def store_games
    @game_store.write_to_storage
  end

  def save_and_exit
    save_collections
    exit
  end
end
