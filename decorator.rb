require_relative 'nameable'
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  attr_accessor :nameable

  def correct_name
    @nameable.respond_to?(:correct_name) ? @nameable.correct_name : 'Unknown'
  end
end
