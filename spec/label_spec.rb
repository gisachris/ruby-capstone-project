require_relative '../classes/book/label'
require_relative '../classes/item'

describe Label do
  context '#initialize' do
    it 'creates a new label with provided attributes' do
      label = Label.new('red', 'Important')
      expect(label.color).to eq('red')
      expect(label.title).to eq('Important')
    end

    it 'assigns a random id if id is not provided' do
      label = Label.new('blue', 'Test Label')
      expect(label.id).to be_between(1, 1000)
    end

    it 'uses the provided id if available' do
      label = Label.new('green', 'Custom ID Label', 42)
      expect(label.id).to eq(42)
    end
  end

  context '#add_item' do
    it 'adds an item to the label and sets its label attribute' do
      label = Label.new('yellow', 'Categorized')
      item = Item.new(Date.new(2022, 1, 1))
      label.add_item(item)
      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end
  end
end
