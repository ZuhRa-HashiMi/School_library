require './rental'
require './people'
require './books'

class RentingBooks
  attr_accessor :rentals, :people, :books

  def initialize(books, person)
    @books = books
    @people = person
    @rentals = []
  end

  def rentalslist
    puts 'Select person'
    @people.peoplelist
    print 'Enter the Id of person you want to select: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}" if rent.person.id == id
    end
  end

  def create_rental
    if @books.books.empty?
      puts 'Book list is empty please create a book first'
    else
      puts 'Select a book from the following list by number'
      @books.booklist
      print "\nEnter book number: "
      book_id = gets.chomp.to_i

      puts 'Select a person from the following list by number (not id)'
      @people.peoplelist
      print "\nEnter person number: "
      person_id = gets.chomp.to_i

      print " \nDate: "
      date = gets.chomp

      rent = Rental.new(date, @books.books[book_id], @people.people[person_id])
      @rentals.push(rent)
      puts 'Rental created successfully!'
    end
  end
end
