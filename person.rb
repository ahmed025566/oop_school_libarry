require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  private

  def of_age?
    age >= 18
  end

  public

  def can_use_services?
    @parent_permission == true || of_age?
  end

  def correct_name
    @name
  end
end