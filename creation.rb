module Creation
  def create_student(name, age)
    classroom = get_user_input('Please Enter Student\'s Classroom: ')
    parent_permission = get_user_input('Has parent permission? [Y/N]: ').upcase

    case parent_permission
    when 'Y'
      # now create the student
      @people << Student.new(age, classroom, name, 'true')
      puts 'Student created successfully!'
    when 'N'
      # now create the student
      @people << Student.new(age, classroom, name, 'false')
      puts 'Student created successfully!'
    else
      puts 'Invalid Input! Should be Y for yes or N for No'
    end
  end

  def create_teacher(age, name)
    specialization = get_user_input('Teacher\'s specialization: ')
    @people << Teacher.new(age, specialization, name, 'true')
    puts 'Teacher created successfully'
  end

  # create a person
  def create_person
    puts 'Do you want to create a student or a Teacher?'
    choice = get_user_input_as_int('Please Enter 1 for a student or 2 for a Teacher: ')
    name = get_user_input('Please Enter Name: ')
    age = get_user_input_as_int('Please Enter Age: ')

    case choice
    # when person being created student
    when 1
      create_student(name, age)

    # when person being created is a teacher
    when 2

      # create a teacher
      create_teacher(age, name)
    else
      puts 'Invalid Input! Should be 1 or 2'
    end
  end

  def create_book
    title = get_user_input('Please Enter Book Title: ')
    author = get_user_input('Please Enter Book Author: ')

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  # create a rental
  def create_rental
    if @books.empty?
      puts 'There are no books to rent'
    else
      puts 'Please select a book number from the following list:'
      list_of_books
      book_number = get_user_input_as_int('Book number: ') - 1

      puts 'Please select a person by number (and not person_id) from the following list:'
      list_of_people
      person_number = get_user_input_as_int('Person Number: ') - 1
      entered_date = get_user_input('Please Enter Today\'s Date, use format(YYYY-MM-DD eg.2022-12-13): ')

      # now you have all neccessary variables create and add a rental
      @rentals << Rental.new(entered_date, @books[book_number], @people[person_number])

      puts 'Rental created successfully'
    end
  end
end
