require './book'

class Books
  attr_accessor :books

  def initialize
    @books = []
  end

  def booklist
    puts 'No book found!' if @books.empty?
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book
    print 'book title: '
    title = gets.chomp

    print 'book author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully'
  end
end
