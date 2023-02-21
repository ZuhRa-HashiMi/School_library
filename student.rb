require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    { 'id' => @id, 'name' => @name, 'age' => @age,
      'parent_permission' => @parent_permission, 'class' => self.class.name }
  end
end
