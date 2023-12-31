require_relative 'person'

class Student < Person
  attr_reader :classrrom

  def initialize(id, age, name, parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
