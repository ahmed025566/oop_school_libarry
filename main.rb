require_relative 'app'
class Main
  app = App.new
  puts "Welcome to our Shcool Library App\n\n"
  loop do
    app.show_options
    choice = gets.chomp.to_i
    case choice
    when 1 then app.list_all_books
    when 2 then app.list_all_people
    when 3 then app.create_person
    when 4 then app.create_book
    when 5 then app.create_rental
    when 6 then app.list_rentals_for_person
    when 7
      puts 'Thanks for using our app!'
      break
    else puts 'Inavalid option. please try again'
    end
  end
end
main = Main.new
main