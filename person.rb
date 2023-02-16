require_relative 'nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  # accessor get method
  attr_reader :id

  # accessor get and set method
  attr_accessor :name, :age

  # private method

  def of_age?
    age >= 18
  end

  # public method

  def can_use_services?
    of_age? || @parent_permission
  end
  def correct_name
    @name
  end
end
person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts capitalizedTrimmedPerson.correct_name
