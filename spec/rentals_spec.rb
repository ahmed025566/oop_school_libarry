require './rentals'
require './book'
require './person'

describe 'Rentals tests' do
  person = Person.new(333, 23, 'Ahmed')
  book = Book.new('Title', 'Author')
  rental = Rentals.new('2023-08-17', person, book)
  it 'should initialize a new rental object' do
    expect(rental).to be_an_instance_of(Rentals)
    expect(rental.person).to eq(person)
    expect(rental.book).to eq(book)
    expect(person.rentals).to include(rental)
    expect(book.rentals).to include(rental)
  end

  it 'should turn rental into hash' do
    hash = rental.to_hash
    expect(hash).to be_a(Hash)
    expect(hash[:date]).to eq('2023-08-17')
    expect(hash[:book]).to eq({ author: 'Author', title: 'Title' })
    expect(hash[:person]).to eq({ id: 333, name: 'Ahmed', age: 23 })
  end
end
