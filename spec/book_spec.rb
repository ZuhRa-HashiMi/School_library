require 'spec_helper'

describe Book do
  describe '#initialize' do
    before :each do
      @books = Book.new('Title', 'Author')
    end

    it 'return a new book object' do
      expect(@books).to be_an_instance_of Book
    end
    it 'takes more than expected parameter' do
      expect { Book.new('title') }.to raise_exception ArgumentError
    end

    it 'check add rental method with empty array' do
      expect(@books.rentals).to eq([])
    end
    it 'Return json representation' do
      expect(@books.to_json).to eq({ 'json_class' => 'Book', 'title' => 'Title', 'author' => 'Author' })
    end

    it 'return the correct title' do
      expect(@books.title).to eq('Title')
    end

    it 'Check by return in correct auther' do
      expect(@books.author).not_to eq('author')
    end
  end
end

describe Books do
  before do
    allow(File).to receive(:directory?).and_return(true)
    allow(File).to receive(:file?).and_return(true)
    allow(File).to receive(:exist?).and_return(true)
    allow(File).to receive(:read).and_return('[]')
    allow(File).to receive(:write)
    allow(FileUtils).to receive(:touch)
    allow(FileUtils).to receive(:mkdir_p)
  end

  describe '#initialize' do
    before :each do
      @books = Books.new
    end

    it 'loads an existing list of books from json' do
      expect(@books.books).to eq([])
    end
  end

  describe '#list_all_books' do
    before :each do
      @books_list = Books.new
    end

    it 'outputs a message when there are on books in the list' do
      expect { @books_list.booklist }.to output("No book found!\n").to_stdout
    end

    it 'create a new list of book' do
      @books_list.books = [{ 'title' => 'Rule 1', 'author' => 'Girma' }]
      expected_output = "0) Title: Rule 1, Author: Girma\n"

      expect { @books_list.booklist }.to output(expected_output).to_stdout
    end
  end
end
