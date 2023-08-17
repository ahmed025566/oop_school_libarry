require_relative 'rentals'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rentals.new(date, person, self)
  end

  def to_hash
    {
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_hash)
    }
  end
end
