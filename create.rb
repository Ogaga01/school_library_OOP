require_relative 'input'

class CreatePeople
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  include Input

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'Database is empty! Add a person.' if @persons.empty?
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def list_all_rentals
    id = user_input('To see rentals enter the person ID: ')

    puts "Rented Books for #{id}:"
    test = false
    @rentals.any? do |rental|
      if rental.person.id == id.to_i
        test = true
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
    puts 'No record were found for the given ID' unless test
  end

  def create_person
    option = user_input('press 1 to create a student, press 2 to create a teacher : ')
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
    save_persons
  end

  def create_student
    puts 'create a new student'
    age = user_input('Enter student age: ').to_i
    name = user_input('Enter name: ').to_i
    parent_permission = user_input('Has parent permission? [Y/N]: ').downcase
    case parent_permission
    when 'n'
      student = Student.new(age, 'classroom', name, false)
      @persons << student
      puts 'Student doesn\'t have parent permission, can\'t rent books'
    when 'y'
      student = Student.new(age, 'classroom', name, true)
      @persons << student
      puts 'Student created successfully'
    end
  end

  def create_teacher
    puts 'create a new teacher'
    age = user_input('Enter teacher age: ').to_i
    specialization = user_input('Enter teacher specialization: ')
    name = user_input('Enter teachers name: ')
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'create a new book'
    title = user_input('Enter title: ')
    author = user_input('Enter author: ')
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
    save_books
  end

  def create_rental
    puts 'select the book you want to rent by entering it\'s number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i
    puts 'select person from the list by its number'
    @persons.each_with_index do |person, index|
      puts "#{index} [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    date = user_input('Date: ').to_s
    rental = Rental.new(date, @persons[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
    save_rentals(date, person_id, book_id)
  end

  def run
    @persons = read_person
    @books = read_book
    @rentals = read_rentals
  end
end
