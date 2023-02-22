require './person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end

  def to_json(*_args)
    { 'id' => @id, 'class' => self.class.name, 'age' => @age, 'name' => @name,
      'parent_permission' => @parent_permission, 'specialization' => @specialization }
  end
end
