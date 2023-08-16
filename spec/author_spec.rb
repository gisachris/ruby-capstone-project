require_relative '../classes/game/author'
require_relative '../classes/item'
require 'rspec'

describe Author do
  let(:author_instance) { Author.new('Sheldon', 'Cooper') }

  before(:each) do
    Author.instance_variable_set(:@all_authors, []) # Reset all_authors before each example
  end

  context 'Testing the Author class' do
    it 'should create an author instance' do
      expect(author_instance).to be_an_instance_of(Author)
    end

    it 'should populate the all_authors array' do
      Author.new('Sheldon', 'Cooper')
      Author.new('Howard', 'Wolowitz')
      expect(Author.all_authors.length).to eq(2)
    end

    it 'should establish a relationship with the Items class' do
      item = Item.new('2010/03/04')
      author_instance.add_item(item)
      expect(author_instance.items).to include(item)
      expect(item.author).to eq(author_instance)
    end

    it 'should provide a hash representation' do
      expected_hash = {
        first_name: 'Sheldon',
        last_name: 'Cooper',
        id: author_instance.id
      }
      expect(author_instance.to_h).to eq(expected_hash)
    end
  end
end
