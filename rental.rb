require_relative 'person'
require_relative 'book'
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_json(*_args)
    { 'date' => @date, 'title' => @book['title'], 'name' => @person['name'], 'id' => @person['id'] }
  end
end
