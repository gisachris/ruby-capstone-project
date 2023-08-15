require_relative 'book/addbook'
require_relative 'book/displaybook'
require_relative 'book/displaylabel'
require_relative 'games/add_game'
require_relative 'games/list_games'
require_relative 'games/list_authors'

module Modules
  include AddBook
  include DisplayBook
  include DisplayLabel
  include AddGame
  include ListGames
  include ListAuthors
end
