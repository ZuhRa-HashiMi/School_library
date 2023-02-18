require './rental'
require './people'
require './books'

class RentingBooks
    attr_accessor :rentals, :people, :books
    
  def initialize
    @books = Books.new()
    @people =  Peoplemodule.new()
    @rentals = []
  end

  def rentalslist
    puts 'Select person'
    @people.peoplelist
    puts 'Enter the Id of person you want to selcet'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts " Date: #{rent.date} Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == id
    end
  end

  def create_rental
    if @books.empty?
      puts 'Book list is empty please create a book first'
    else
      puts 'Select a book from the following list by number'
      @books.booklist
      print '\nEnter book number: '
      book_id = gets.chomp.to_i

      puts 'Select a person from the following list by number (not id)'
      @people.peoplelist
      print '\nEnter person number: '
      person_id = gets.chomp.to_i

      print '\nDate: '
      date = gets.chomp

      rent = Rental.new(date, @people[person_id], @books[book_id])
      @rentals.push(rent)
      puts 'Rental created successfully!'
    end
  end
end