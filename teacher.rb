require_relative './person'

class Teacher < Person
    def initialize(age, name = 'Unknown', parent_permission: true)
        super(age, name, parent_permission: parent_permission)
        @specialization = specialization
end