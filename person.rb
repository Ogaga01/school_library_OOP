require './nameable'
# rubocop:disable Naming/PredicateName

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :books, :rentals

  def initialize(age, name: 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def correct_name
    @name
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def is_of_age?
    @age >= 18
  end
end

# rubocop:enable Naming/PredicateName
