require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

person = Person.new(22, 'maximilianus')
person.correct_name
puts(person.correct_name)
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
puts(capitalized_person.correct_name)
capitalized_trimmed_person = TimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
puts(capitalized_trimmed_person.correct_name)
