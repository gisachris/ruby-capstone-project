require_relative 'book/addbook'
require_relative 'book/displaybook'
require_relative 'book/displaylabel'
require_relative 'games/add_game'
require_relative 'games/add_author'
require_relative 'games/list_games'
require_relative 'games/list_authors'
require_relative 'book/load_book_label'
require_relative 'book/preservedata'

module Modules
  include AddBook
  include DisplayBook
  include DisplayLabel
  include AddGame
  include AddAuthor
  include ListGames
  include ListAuthors
  include PreserveData
  include LoadData

  def save_collections
    save_book
    save_label
  end

  def load_collections
    load_labels
    load_books
  end
end
