require_relative 'decorator'
class TimmerDecorator < Decorator
    def correct_name
        @nameable.correct_name[0, 10]
    end
end
