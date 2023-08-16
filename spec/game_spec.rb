require_relative '../classes/game/game'
require_relative '../classes/item'
require 'rspec'

describe Game do
  context 'when testing the Game class' do
    let(:fake_author) { double('author') }

    before(:each) do
      allow(fake_author).to receive(:first_name).and_return('Sheldon')
      allow(fake_author).to receive(:last_name).and_return('Cooper')
      Game.instance_variable_set(:@all_games, [])
    end

    it 'creates a game instance' do
      game1 = Game.new(true, '2010/04/03', '2019/03/04')
      expect(game1).to be_instance_of(Game)
    end

    it 'verifies that Game class inherits from Item class' do
      expect(Game.superclass).to eq(Item)
    end

    it 'populates the game array accordingly' do
      Game.new(true, '2010/04/03', '2019/03/04')
      Game.new(false, '2013/12/01', '2019/08/01')
      game_array = Game.all_games
      expect(game_array.length).to eq(2)
    end
  end

  context 'when checking date and author' do
    let(:fake_author) { double('author') }

    before(:each) do
      allow(fake_author).to receive(:first_name).and_return('Sheldon')
      allow(fake_author).to receive(:last_name).and_return('Cooper')
      Game.instance_variable_set(:@all_games, [])
    end

    it 'checks that last_played time variable is a date' do
      game_instance = Game.new(true, '2010/04/03', '2019/03/04')
      expect(game_instance.last_played).to be_a(Date)
    end

    it 'initializes successfully when no author is given' do
      game_instance = Game.new(true, '2010/04/03', '2019/03/04')
      expect(game_instance.author).to be_nil
    end

    it 'initializes successfully when an author is given' do
      game_instance = Game.new(true, '2010/04/03', '2019/03/04', fake_author)
      expect(game_instance.author.first_name).to eq('Sheldon')
    end
  end

  context 'when archiving a game' do
    it 'archives a game when eligible' do
      game_instance = Game.new(true, '2010/04/03', '2010/04/05')
      expect(game_instance.can_be_archived?).to be_truthy
    end

    it 'does not archive a game when not eligible' do
      game_instance = Game.new(true, '2010/04/03', (Date.today - 1).to_s)
      expect(game_instance.can_be_archived?).to be_falsey
    end
  end
end
