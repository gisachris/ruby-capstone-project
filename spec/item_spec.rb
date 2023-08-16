require_relative '../classes/item'
require_relative '../classes/game/author'
require_relative '../classes/book/label'
require 'rspec'

describe Item do
  let(:label) { double('label') }
  let(:author) { double('author') }

  before(:each) do
    @item = Item.new('2010/03/04')
    allow(label).to receive(:title).and_return('test title')
    allow(label).to receive(:color).and_return('test green')
    allow(label).to receive(:add_item)
    allow(author).to receive(:first_name).and_return('sheldon')
    allow(author).to receive(:last_name).and_return('cooper')
    allow(author).to receive(:add_item)
  end

  context 'Testing Item class' do
    it 'Should initialise correctly' do
      expect(@item).to be_an_instance_of(Item)
    end
  end

  context 'Testing Functionality of methods for the Item class' do
    it 'should be able to add a label' do
      @item.add_label(label)
      expect(@item.label.title).to eq('test title')
    end

    it 'should be able to add an author' do
      @item.add_author(author)
      expect(@item.author.first_name).to eq('sheldon')
    end

    it 'should check for archive readiness and return true if publish date > 10 years' do
      expect(@item.can_be_archived?).to be_truthy
    end

    it 'should check for archive readiness and return false if publish date < 10 years' do
      item_instance = Item.new('2020/05/05')
      expect(item_instance.can_be_archived?).to be_falsey
    end

    it 'should be able to be moved to archive when old enough' do
      @item.move_to_archive
      expect(@item.archived).to be_truthy
    end

    it 'should not be able to be moved to archive when not old enough' do
      new_item_instance = Item.new('2020/05/05')
      new_item_instance.move_to_archive
      expect(new_item_instance.archived).to be_falsey
    end
  end
end
