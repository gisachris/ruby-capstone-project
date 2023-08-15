require_relative 'classes/book/book'
require_relative 'classes/book/label'
require_relative 'modules/modules'

class App
  attr_accessor :books

  include Modules

  def initialize
    @books = []
    @label = []
  end

  def run(options)
    case options
    when 1
      display_books
    when 4
      display_labels
    when 7
      add_book
    else
      puts 'Thank you for using this app!'
    end
  end
end
