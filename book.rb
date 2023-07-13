class Book
  attr_accessor :title, :author, :rentals

  def initialize(title = 'unknown', author = 'unknown')
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [title, author]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
