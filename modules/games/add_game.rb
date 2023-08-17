module AddGame
  def add_new_game
    multiplayer_choice = multiplayer
    publish_date = published_date
    last_played_date = last_played
    selected_author = select_author

    Game.new(multiplayer_choice, publish_date, last_played_date, selected_author)
    puts 'New game added succesfully'
  end

  def multiplayer
    puts 'is this a multiplayer game..?[Y/N]'
    answer = gets.chomp
    return true if answer == 'y'

    false
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
    alert = author_num
    print "select from published authors list(1) #{alert}, or create new one(2): "
    answer = gets.chomp.to_i

    if answer == 1
      list_all_authors_not_smooth
      puts 'select from the above authors by number (not id) if non click enter:'
    answer = gets.chomp
    return if answer.empty?

    find_author(answer)
    elsif answer == 2
      newauthor = add_new_author
      return newauthor
    else
      print 'choice was incorrect!'
      return
    end      
  end

  def find_author(placement_index)
    placement_index = placement_index.to_i
    selected_author = Author.all_authors[placement_index]

    return selected_author unless selected_author.nil?

    puts 'Author not found at that position!'
    false
  end

  def author_num
    author_array = Author.all_authors
    print '(currently empty)' if author_array.empty?
  end
end
