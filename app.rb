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
  include Storage
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
    when 1 then display_books
    when 2 then display_all_music_albums
    when 3 then list_all_games
    when 4 then display_labels
    when 5 then list_all_authors
    when 6 then list_all_sources
    when 7 then display_all_genres
    when 8 then add_book
    when 9 then add_music
    when 10 then add_new_game
    else
      exit_app
    end
  end

  private

  def exit_app
    puts 'Thank you for using this app!'
    store_games
    save_music
    save_and_exit
  end

  def store_games
    @game_store.write_to_storage
  end

  def save_and_exit
    save_collections
    exit
  end
end