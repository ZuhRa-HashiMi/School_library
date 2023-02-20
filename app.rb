require './books'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './people'
require './rentingbooks'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = Books.new
    @people = Peoplemodule.new
    @rentals = RentingBooks.new(@books, @people)
  end

  def booklist
    @books = books
  end

  def peoplelist
    @people
  end

  def 
end
