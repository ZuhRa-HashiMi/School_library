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

  def create_person
    @people.person
  end

  def create_book
    @books.create
  end

  def create_rental
    @rentals.create
  end

  def rentalslist
    @rentals
  end
end

