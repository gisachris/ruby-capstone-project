require '../item'
require 'date'

class Game < Item
  def initialize(multiplayer, publish_date, last_played_at, id = nil)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played = Date.parse(last_played_at)
  end

  def can_be_archived?
    super() && old_enough?
  end

  private

  def old_enough?
    current_year = Date.today.year
    last_played_year = @last_played.year
    current_year - last_played_year > 2
  end
end
