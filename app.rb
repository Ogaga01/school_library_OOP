require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'
require 'json'
require './data/read_write'

class App
  def initialize
    super
    @books = []
    @persons = []
    @rentals = []
  end
end
