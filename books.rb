require 'json'
require 'fileutils'
require './book'

class Books
  FILE_STORE = './data/book.json'.freeze
  attr_accessor :books

  def initialize
    @books = load_books
  end

  def load_books
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
    File.write(FILE_STORE, JSON.pretty_generate(@books))
  end

  def booklist
    puts 'No book found!' if @books.empty?
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book['title']}, Author: #{book['author']}" }
  end

  def create_book
    print 'book title: '
    title = gets.chomp.capitalize

    print 'book author: '
    author = gets.chomp.capitalize

    book = Book.new(title, author).to_json
    @books.push(book)
    save_file
    puts 'Book created successfully'
  end
end
