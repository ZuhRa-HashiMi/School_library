require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App 
    def initialize 
        @book = []
        @people = []
        @rental = []
    end

    def book_list 
        if @book.empty?
            puts 'Book list is empty, please try to add a book. Thank you.'
        else
            @book.each_with_index do |book, index|
                puts "(#{index}) Title: #{book.title}, Author: #{book.author}"
            end
        end
    end

    def people_list 
        if @people.empty?
            puts 'People list is empty, please try to add a people. Thank you.'
        else
            @people.each do |person|
                puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
            end
        end
    
        def show_people
            @people.each_with_index do |person, index|
                puts "(#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
            end
        end

        def show_rental
            puts 'Select person'
            show_people
            puts "Enter the Id of person you want to selcet"
            id = gets.chomp.to_i
            puts "Rentals:"
            @rental.each do |rent|
                puts " Date: #{rent.date} Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == id
            end
        end

        def create_person
            print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
            option = gets.chomp
        
            case option
            when '1'
              create_student
            when '2'
              create_teacher
            else
              puts 'invalid input'
            end
        
            write_people(@people)
            puts 'Person created successfully'
          end
    end
end