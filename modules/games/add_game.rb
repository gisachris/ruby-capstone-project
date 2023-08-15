module AddGame
  def add_new_game
    multiplayer_choice = multiplayer
    publish_date = published_date
    last_played_date = last_played
    selected_author = select_author

    new_game = Game.new(multiplayer_choice, publish_date, last_played_date, selected_author)
    puts "New game added succesfully"
  end

  def multiplayer
    puts 'is this a multiplayer game..?[Y/N]'
    answer = gets.chomp
    print 'wrong choice!' unless answer.downcase == 'y' || answer.downcase == 'n'
  end

  def published_date
    puts 'Please Enter publish date in following format yyyy/mm/dd'
    gets.chomp
  end

  def last_played
    puts 'Please Enter last date you played in following format yyyy/mm/dd'
    gets.chomp
  end

  def select_author
    list_all_authors
    puts 'select from the above authors by number (not id):'
    answer = gets.chomp
    return if answer.empty?
    find_author(answer)
  end

  def find_author(placement_index)
    placement_index = placement_index.to_i
    selected_author = Author.all_authors[placement_index]

    if selected_author.nil?
      puts 'Author not found at that position!'
      return false
    else
      return selected_author
    end
  end
end