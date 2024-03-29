require_relative './app'
require_relative './create'

class PrintScript < CreatePeople
  def run_app
    puts 'welcome to the Amazing School Library App!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank You for using our school Library!'
        break
      end

      option input
    end
  end

  def list_of_options
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - list all books'
    puts '2 - list all people'
    puts '3 - create a person'
    puts '4 - create a book'
    puts '5 - create a renter'
    puts '6 - list all renters for a given person id'
    puts '7 - Exit'
  end

  def option(input)
    case input
    when '1'
      list_all_books
    when '2'
      list_all_persons
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    else
      puts 'Please enter a number between 1 and 7'
    end
  end
end

def main
  app = PrintScript.new
  app.run
  app.run_app
end

main
