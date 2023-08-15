class Rentals
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    # person.rentals << self
    @book = book
    # book.rentals << self
  end

  def to_hash
    {
      date: @date
      book: {
        title: @book.title
        author: @book.author
      }
      person: {
        id: @person.id
        name: @person.name
        age: @person.age
      }
    }
end
