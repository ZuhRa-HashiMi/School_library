require_relative './app'

puts 'Welcome to your school library'

def main
  app = App.new
  app.start
end

class Main
  app = App.new

  puts 'welcome to School Library App!'
  puts 'Please choose an option by entering a number:'

  loop do
    puts "\n"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts "\n"

    option = gets.chomp

    case option
    when '1'
      app.books.booklist
    when '2'
      app.people.peoplelist
    when '3'
      app.people.create_person
    when '4'
      app.books.create_book
    when '5'
      app.rentals.create_rental
    when '6'
      app.rentals.rentalslist
    when '7'
      puts puts "Thank you for using this app!\n\n"
      break
    else
      puts 'Incorrect choice, Please choose between 1 and 7'
    end
  end
end
Main.new
