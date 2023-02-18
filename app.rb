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
    end
end