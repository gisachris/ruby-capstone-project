module ListGames
  def list_all_games
    if @games_list.empty?
      puts 'No games have been stored yet!'
    else
      @games_list.each_with_index do |game, i|
        dates = "published on: #{game.publish_date}, last played: #{game.last_played}"
        mult_choice = game.multiplayer.to_s

        if game.author.nil?
          puts "#{i}) multiplayer: #{mult_choice}, author: not specified, #{dates}"
        else
          puts "#{i}) multiplayer: #{mult_choice},author: #{game.author.first_name} #{game.author.last_name}, #{dates}"
        end
      end
    end
    puts 'Press enter to continue'
    gets.chomp
  end
end
