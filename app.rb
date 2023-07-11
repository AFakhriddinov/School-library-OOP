require './book'
require './person'
require './rental'
require './teacher'
require './student'
require './classroom'
require './creation'

class App
  # setters and getters
  attr_accessor :people, :books, :rentals

  # contructor method
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  include Creation

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

  def rentals_by_person_id
    if !@people.empty? && !@rentals.empty?
      puts 'Please select person id from the following list of people:'
      list_of_people
      id = get_user_input_as_int('Person id: ')

      @rentals.each do |rental|
        return puts "No book found by person id #{id}" unless rental.person.id == id

        puts "Book Name: #{rental.book.title} Book Author: #{rental.book.author} Date: #{rental.date}"
      end
    else
      puts 'There are no rentals'
    end
  end

  private

  def get_user_input(message)
    print message
    gets.chomp
  end

  def get_user_input_as_int(message)
    print message
    gets.chomp.to_i
  end
end
