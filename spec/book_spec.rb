require_relative '../classes/book/book'

describe Book do
  let(:publish_date) { '2000-01-01' }
  let(:cover_state_good) { 'good' }
  let(:cover_state_bad) { 'bad' }
  let(:publisher) { 'Example Publisher' }

  context 'when creating a new book' do
    it 'should have the correct attributes' do
      book = Book.new(cover_state_good, publisher, publish_date)

      expect(book.cover_state).to eq(cover_state_good)
      expect(book.publisher).to eq(publisher)
      expect(book.publish_date).to eq(publish_date)
    end

    it 'should inerit from Item' do
      expect(Book.superclass).to eq(Item)
    end
  end

  context 'when checking if a book can be archived' do
    it 'should be archivable if cover state is bad' do
      book = Book.new(cover_state_bad, publisher, publish_date)
      expect(book.can_be_archived?).to be(true)
    end

    it "should be archivable if it's older than 10 years" do
      old_publish_date = (Date.today - (11 * 365)).to_s
      book = Book.new(cover_state_good, publisher, old_publish_date)
      expect(book.can_be_archived?).to be(true)
    end

    it "should not be archivable if it's newer than 10 years and cover state is good" do
      recent_publish_date = (Date.today - (5 * 365)).to_s
      book = Book.new(cover_state_good, publisher, recent_publish_date)
      expect(book.can_be_archived?).to be(false)
    end
  end
end
