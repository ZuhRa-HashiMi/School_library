require './rental'
require './people'
require './books'

class RentingBooks
  FILE_STORE = './data/rental.json'.freeze
  attr_accessor :rentals, :people, :books

  def initialize(books, person)
    @books = books
    @people = person
    @rentals = load_rental
  end

  def load_rental
    if File.directory?('data') && File.file?(FILE_STORE)
      File.zero?(FILE_STORE) ? [] : JSON.parse(File.read(FILE_STORE))
    elsif File.directory?('data') && !File.exist?(FILE_STORE)
      FileUtils.touch(FILE_STORE)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_STORE)
      []
    end
  end

  def save_file
    File.write(FILE_STORE, JSON.pretty_generate(@rentals))
  end

  def rentalslist
    puts 'Select person'
    @people.peoplelist
    print 'Enter the Id of person you want to select: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rent|
      puts "Date: #{rent['date']}, Book: #{rent['title']} by #{rent['name']}" if rent['id'] == id
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

      rent = Rental.new(date, @books.books[book_id], @people.people[person_id]).to_json
      @rentals.push(rent)
      save_file
      puts 'Rental created successfully!'
    end
  end
end
