class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = published_date
    @archived = archived
  end

  def move_to_archived?
    @archived = true if can_be_archive?
  end

  private

  def can_be_archive?
    @published_date > 10.years.ago
  end
end
