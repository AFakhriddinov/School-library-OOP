class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [@date, @book, @person]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
