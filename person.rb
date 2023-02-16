class Person
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
  private

  def of_age?
    age >= 18
  end

  # public method
  public 
  def can_use_services?
    of_age? || @parent_permission
  end
end
