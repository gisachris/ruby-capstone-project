require_relative 'author'
require_relative 'game'
require 'json'
require 'fileutils'

class GameAuthorStorage
  DATA_DIRECTORY = 'data'.freeze

  def write_to_storage
    @all_games = Game.all_games
    @all_authors = Author.all_authors

    FileUtils.mkdir_p(DATA_DIRECTORY)

    games_file = File.open("#{DATA_DIRECTORY}/games.json", 'w')
    games_data = @all_games.map(&:to_h)
    games_file.puts(JSON.pretty_generate(games_data))
    games_file.close

    authors_file = File.open("#{DATA_DIRECTORY}/authors.json", 'w')
    authors_data = @all_authors.map(&:to_h)
    authors_file.puts(JSON.pretty_generate(authors_data))
    authors_file.close
    puts 'Storing game data successfully'
    puts
    puts 'press enter to continue'
    gets.chomp
  end

  def read_from_storage
    games_data = read_json_data("#{DATA_DIRECTORY}/games.json")
    authors_data = read_json_data("#{DATA_DIRECTORY}/authors.json")

    if games_data.nil? && authors_data.nil?
      puts 'No game data found in JSON files.'
      return
    end

    populate_games(games_data) unless games_data.empty?
    populate_authors(authors_data) unless authors_data.empty?
  end



  private

  def read_json_data(file_path)
    return [] unless File.exist?(file_path)

    json_data = File.read(file_path)
    JSON.parse(json_data)
  end

  def populate_authors(authors_data)
    authors_data.each do |author_data|
      Author.new(
        author_data['first_name'],
        author_data['last_name'],
        author_data['id']
      )
    end
  end

  def populate_games(games_data)
    games_data.each do |game_data|
      author = find_author(game_data['author_id'])
      Game.new(
        game_data['multiplayer'],
        game_data['publish_date'],
        game_data['last_played'],
        author,
        game_data['id']
      )
    end
  end

  def find_author(author_id)
    Author.all_authors.find { |author| author.id == author_id }
  end
end
