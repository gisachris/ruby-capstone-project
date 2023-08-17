#  require_relative '../item'

# class Genre
#   attr_accessor :name, :items
#   attr_reader :id

#   @genres = []

#   def initialize(name)
#     @id = Random.rand(1..1000)
#     @name = name
#     @items = []
#   end

#   def add_items(item)
#     @items << item
#     item.genre = self
#   end

#   def to_hash
#     {
#       'id' => @id,
#       'name' => @name#
#     }
#   end
# end
class Genre
  attr_reader :name, :id
  attr_accessor :items, :genre

  def initialize(name:, id: nil)
    @id = id || rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name
    }
  end
end
