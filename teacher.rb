require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(id, age, name, specialization)
    super(id, age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
