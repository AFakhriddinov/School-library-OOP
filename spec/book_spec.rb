require_relative '../book'
require 'json'

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

  describe '#add_rental' do
    it 'creates a new rental' do
      teacher = Teacher.new('Teacher', 'Biology', 34)
      rental = @book.add_rental(teacher, '2021-02-01')
      expect(rental).to be_an_instance_of Rental
    end
  end

  describe '#to_json' do
    it 'returns a JSON string' do
      expect(@book.to_json).to be_a String
    end
  end

  describe '#json_create' do
    it 'returns a Book object' do
      json = @book.to_json
      book = JSON.parse(json)
      expect(Book.json_create(book)).to be_an_instance_of Book
    end
  end
end
