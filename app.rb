require_relative 'classes/book/book'
require_relative 'classes/book/label'
require_relative 'modules/modules'
require_relative 'classes/game/author'
require_relative 'classes/game/game'
require_relative 'classes/game/game_author_storage'

class App
  attr_accessor :books

  include Modules

  def initialize
    @books = []
    @label = []
    @authors_list = Author.all_authors
    @games_list = Game.all_games
  end

  def run(options)
    case options
    when 1
      display_books
    when 3
      list_all_games
    when 4
      display_labels
    when 5
      list_all_authors
    when 7
      add_book
    when 9
      add_new_game
    else
      puts 'Thank you for using this app!'
    end
  end

  # def read_game_storage
  #   @game_store.read_from_storage
  # end

  # def write_game_storage
  #   @game_store.write_to_storage
  # end
end
