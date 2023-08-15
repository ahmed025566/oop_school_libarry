require_relative 'nameable'
require_relative 'rentals'
class Person < Nameable
  attr_accessor :name, :age, :classroom, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(date, book)
    Rentals.new(date, self, book)
  end

  def to_hash
    {
      id: @id
      name: @name
      age: @age
      rentals: @rentals.map(:&to_hash)
    }
end
