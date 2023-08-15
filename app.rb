require_relative 'classes/book/book'
require_relative 'classes/book/label'
require_relative 'modules/modules'

class App
  attr_accessor :books, :label

  include Modules

  def initialize
    @books = []
    @label = []
    load_collections
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
      save_and_exit
    end
  end

  def save_and_exit
    save_collections
    exit
  end
end
