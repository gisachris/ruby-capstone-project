require_relative 'app'

class Main
  def initialize
    @app = App.new
    prompt
  end

  def prompt
    puts 'Catalogue of things!'
    loop do
      display_options
      option = take_input
      @app.run(option)
      next unless option == 10

      @app.store_games
      @app.store_music
      break
    end
  end

  def display_options
    puts 'Please choose one of the options: '
    puts '1. - List all books'
    puts '2. - List all music albums'
    puts '3. - List all games'
    puts "4. - List all labels (e.g. 'Gift', 'New)"
    puts "5. - List all authors (e.g. 'Stephen King')"
    puts "6. - List all genres (e.g. 'Comedy', 'Thriller')"
    puts '7. - Add book'
    puts '8. - Add a music album'
    puts '9. - Add a game'
    puts '10. - Exit'
  end

  def take_input
    print 'Enter a number: '
    option = gets.chomp.to_i
    while option.nil? || option < 1 || option > 10
      puts 'Please enter a number between 1 and 10!'
      print 'Enter a number: '
      option = gets.chomp.to_i
    end
    option
  end
end

Main.new
