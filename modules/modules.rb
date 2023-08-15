require_relative 'book/addbook'
require_relative 'book/displaybook'
require_relative 'book/displaylabel'

module Modules
  include AddBook
  include DisplayBook
  include DisplayLabel
end
