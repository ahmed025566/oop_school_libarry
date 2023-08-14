require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rentals'

class App
  def initialize
    @people = []
    @books = []
  end

  def list_all_books(select: false)
    @books.each_with_index do |book, idx|
      puts "#{select ? "#{idx}) " : ''}Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_all_people(select: false)
    @people.each_with_index do |person, idx|
      role = person.is_a?(Teacher) ? 'Teacher' : 'Student'
      puts "#{select ? "#{idx}) " : ''}[#{role}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase == 'y'
    @people << Student.new(age, name, parent_permission: permission)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    puts 'Person created successfully'
  end

  def create_person
    print 'Do you want to create a stduent (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    case choice
    when 1 then create_student
    when 2 then create_teacher
    else puts 'Invalid choice'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    puts 'Book created successfully'
    @books << Book.new(title, author)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books(select: true)
    book_id = gets.chomp.to_i
    book = @books[book_id]
    puts "\nSelect a person from the following list by number (not id)"
    list_all_people(select: true)
    person_id = gets.chomp.to_i
    print "\nDate: "
    date = gets.chomp
    person = @people[person_id]
    person.add_rental(date, book)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = @people.find do |p|
      p.id == person_id
    end
    return unless person

    puts 'Rentals'
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def show_options
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end
