require '../item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played, :author
  attr_reader :all_games

  @all_games = []

  def initialize(multiplayer, publish_date, last_played_at, author, id = nil)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played = Date.parse(last_played_at)
    @author = author
    self.class.all_games << self
  end

  def self.all_games
    @all_games
  end

  def can_be_archived?
    super() && old_enough?
  end

  def to_h
    {
      multiplayer: @multiplayer,
      publish_date: @publish_date.to_s,
      last_played: @last_played.to_s,
      author_id: @author.id,
      id: @id
    }
  end

  private

  def old_enough?
    current_year = Date.today.year
    last_played_year = @last_played.year
    current_year - last_played_year > 2
  end
end
