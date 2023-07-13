require './book'
require './person'
require './rental'
require './teacher'
require './student'
require './classroom'
require './creation'
require './listing'

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
  include Listing

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
