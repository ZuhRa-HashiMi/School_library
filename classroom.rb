class Classroom 
    attr_accessor :label, :students

    def initialize(label)
        @label = label
        @students = []
    end

    def add_studens(student)
        @students.push(student)
        student.classroom = self
    end
end
classes = Classroom.new("one")
p classes.students
p classes.add_studens("zuhra")