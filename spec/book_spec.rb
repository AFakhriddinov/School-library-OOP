require_relative '../book'

RSpec.describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'receives two parameters and output a book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'shows the correct title' do
      expect(@book.title).to eql('Title')
    end
  end

  describe '#author' do
    it 'shows the correct author' do
      expect(@book.author).to eql('Author')
    end
  end
end