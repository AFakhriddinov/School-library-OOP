module Listing
  # list all books
  def list_of_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each_with_index do |book, i|
        puts "#{i + 1} title: #{book.title} author: #{book.author}"
      end
    end
  end

  # list all people
  def list_of_people
    if @people.empty?
      puts 'There are no people'
    else
      @people.each_with_index do |person, i|
        puts "#{i + 1} name: #{person.name} age: #{person.age} person_id: #{person.id}"
      end
    end
  end

  def print_rental(rental)
    "Book Name: #{rental.book.title} Book Author: #{rental.book.author} Date: #{rental.date}"
  end

  def rentals_by_person_id
    if !@people.empty? && !@rentals.empty?
      puts 'Please select person id from the following list of people:'
      list_of_people
      id = get_user_input_as_int('Person id: ')
      rentals_by_person = @rentals.map { |rental| print_rental(rental) if rental.person.id == id }

      rentals_by_person.empty? ? (puts "No book found by person id #{id}") : (puts rentals_by_person)
    else
      puts 'There are no rentals'
    end
  end
end
