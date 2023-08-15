require_relative 'author'
require_relative 'game'
require 'json'

class GameAuthorStorage
  DATA_DIRECTORY = '../../data'.freeze

  def write_to_storage
    @all_games = Game.all_games
    @all_authors = Author.all_authors

    Dir.mkdir(DATA_DIRECTORY) unless Dir.exist?(DATA_DIRECTORY)

    games_file = File.open("#{DATA_DIRECTORY}/games.json", 'w')
    games_data = @all_games.map(&:to_h)
    games_file.puts(JSON.pretty_generate(games_data))
    games_file.close

    authors_file = File.open("#{DATA_DIRECTORY}/authors.json", 'w')
    authors_data = @all_authors.map(&:to_h)
    authors_file.puts(JSON.pretty_generate(authors_data))
    authors_file.close
  end

  def read_from_storage
    # Implement reading from JSON files and populating objects
  end
end
