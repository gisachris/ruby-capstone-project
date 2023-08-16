require_relative 'book/addbook'
require_relative 'book/displaybook'
require_relative 'book/displaylabel'
require_relative 'book/load_book_label'
require_relative 'book/preservedata'

module Modules
  include AddBook
  include DisplayBook
  include DisplayLabel
  include PreserveData
  include LoadData

  def save_collections
    save_book
    save_label
  end

  def load_collections
    load_labels
    load_books
  end
end
