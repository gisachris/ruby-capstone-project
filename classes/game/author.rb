class Author
  attr_reader :items, :id, :all_authors

  @all_authors = []

  def initialize(first_name, last_name, id = nil)
    @id = id || Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
    self.class.all_authors << self
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  class << self
    attr_reader :all_authors
  end

  def to_h
    {
      first_name: @first_name,
      last_name: @last_name,
      id: @id
    }
  end
end
