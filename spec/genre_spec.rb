require_relative '../classes/music/genre'
require_relative '../classes/item'

describe 'Testing Genre classes' do
  before(:context) do
    @genre = Genre.new(name: 'Song')  
  end

  context 'Testing Genre instance and Method' do
    it 'Testing name instance' do
      expect(@genre.name).to eq 'Song'
    end

    it 'Testing add_item method' do
      @item = Item.new('2023-03-03')
      @genre.add_item(@item)
      expect(@genre.items).to include(@item)
      expect(@item.genre).to eq(@genre)  
    end
  end
end
