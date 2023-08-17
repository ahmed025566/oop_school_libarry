require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rentals'
require_relative 'loader'
class App
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
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

  def create_student(id, age, name, parent_permission: true)
    @people << Student.new(id, age, name, parent_permission:)
  end

  def create_teacher(id, age, name, specialization)
    @people << Teacher.new(id, age, name, specialization)
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book_id, person_id, date)
    book = @books[book_id]
    person = @people[person_id]
    @rentals << Rentals.new(date, person, book)
  end

  def list_rentals_for_person(person_id)
    puts 'Rentals'
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def save_date
    books_json = @books.map(&:to_hash)
    rentals_json = @rentals.map(&:to_hash)
    people_json = @people.map(&:to_hash)

    File.write('storage/books.json', JSON.generate(books_json))
    File.write('storage/people.json', JSON.generate(people_json))
    File.write('storage/rentals.json', JSON.generate(rentals_json))
  end
end
