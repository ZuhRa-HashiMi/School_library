require './person'

class Peoplemodule
  attr_accessor :people

  def initialize
    @people = []
  end

  def peoplelist
    puts 'No one found!' if @people.empty?
    @people.each { |person| puts "[#{person.class}], Name: #{person.name}, Age: #{person.age}, Id: #{person.id}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'invalid input'
    end
  end

  def create_teacher
    print 'teacher age: '
    age = gets.chomp

    print 'teacher specialization: '
    specialization = gets.chomp

    print 'teacher name: '
    name = gets.chomp

    teacher = Teacher.new(age, specialization, name, parent_permission: true)
    puts 'Teacher created successfully'
    @people.push(teacher)
  end

  def create_student
    print 'student age: '
    age = gets.chomp

    print 'student name: '
    name = gets.chomp

    print 'has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      @people.push(student)
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @people.push(student)
    end
    puts 'Student created successfully'
  end
end
