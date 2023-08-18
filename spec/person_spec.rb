require './person'
require './rentals'
require './book'

describe 'Person tests' do
  person = Person.new(888, 23, 'Ahmed', parent_permission: false)
  book = Book.new('Title', 'Author')
  date = '2023-08-17'
  it 'should initialize a new person object' do
    expect(person).to be_an_instance_of(Person)
    expect(person.id).to eq(888)
    expect(person.age).to eq(23)
    expect(person.name).to eq('Ahmed')
    expect(person.parent_permission).to eq(false)
    expect(person.rentals).to be_empty
  end

  it 'should return the output of can use services method' do
    expect(person.can_use_services?).to eq(true)
    person.age = 17
    expect(person.can_use_services?).to eq(false)
  end

  it 'should return the name of the person' do
    expect(person.correct_name).to eq(person.name)
  end
  it 'shpuld add a rental to the person' do
    rental = person.add_rental(date, book)
    expect(rental.person).to eq(person)
    expect(person.rentals).to include(rental)
  end
end

describe 'hash tests' do
  it 'should turn person object into a hash' do
    person = Person.new(888, 23, 'Ahmed', parent_permission: false)
    book = Book.new('Title', 'Author')
    date = '2023-08-17'
    rental = person.add_rental(date, book)
    hash = person.to_hash
    expect(hash).to be_a(Hash)
    expect(hash[:id]).to eq(888)
    expect(hash[:age]).to eq(23)
    expect(hash[:name]).to eq('Ahmed')
    expect(hash[:rentals]).to include(rental.to_hash)
  end
end
