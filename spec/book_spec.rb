require './book'
require './person'
require './rentals'

describe 'book tests' do
  it 'creates a new book' do
    book = Book.new('Title', 'Author')
    expect(book.title).to eq('Title')
    expect(book.rentals).to be_empty
  end

  it 'should add a rental to book' do
    book = Book.new('Title', 'Author')
    date = '2023-089-17'
    person = Person.new(777, 23, 'Ahmed')
    rental = book.add_rental(date, person)
    expect(rental).to be_an_instance_of(Rentals)
    expect(rental.book).to eq(book)
    expect(book.rentals).to include(rental)
  end

  it 'should trun book object into hash' do
    book = Book.new('Title', 'Author')
    rental = instance_double('Rentals', to_hash: { date: '2023-08-17' })
    book.rentals << rental
    hash = book.to_hash
    expect(hash).to be_a(Hash)
    expect(hash[:title]).to eq('Title')
    expect(hash[:author]).to eq('Author')
    expect(hash[:rentals]).to include(rental.to_hash)
  end
end
