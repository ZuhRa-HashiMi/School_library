require './person'

class Peoplemodule
  FILE_STORE = './data/person.json'.freeze
  attr_accessor :people

  def initialize
    @people = load_person
  end

#  add def load


  def peoplelist
    puts 'No one found!' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person['class']}], Name: #{person['name']}, Age: #{person['age']}, Id: #{person['id']}"
    end
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
    specialization = gets.chomp.capitalize

    print 'teacher name: '
    name = gets.chomp.capitalize

    teacher = Teacher.new(age, specialization, name, parent_permission: true).to_json
    puts 'Teacher created successfully'
    @people.push(teacher)
    save_file
  end

  def create_student
    print 'student age: '
    age = gets.chomp

    print 'student name: '
    name = gets.chomp.capitalize

    print 'has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false).to_json
      @people.push(student)
      save_file
    when 'y'
      student = Student.new(age, name, parent_permission: true).to_json
      @people.push(student)
      save_file
    end
    puts 'Student created successfully'
  end
end
