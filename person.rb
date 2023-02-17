require_relative 'nameable'
class Person < Nameable
    # accessor get method
    attr_reader :id
    # accessor get and set method
    attr_accessor :name, :age
    
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

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
