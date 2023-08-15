module ListGames
  def list_all_games
    if @games_list.empty?
      puts 'No games have been stored yet!'
    else
      @games_list.each_with_index do |game,i|
        puts "#{i}) multiplayer: #{game.multiplayer}, author:#{game.author.first_name} #{game.author.last_name}, published on: #{game.publish_date}, last played: #{game.last_played}"
      end
    end
  end
end