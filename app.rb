require 'person'
require 'student'
require 'teacher'
require 'book'
require 'classroom'
require 'rental'
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
