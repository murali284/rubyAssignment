require './bookTicketsFunctions'
bus_seats = Array.new(4) {Array.new(10,' ')}
puts('This is your excel Sheet')
while 1 do
  puts "Action List:\n1) Show Seating\n2) Book Ticket\n3) Cancel Ticket\n4) Exit\nEnter your action choice :"
  choice = gets.chomp.to_i
  case choice
    when 1
      _print_seats(bus_seats)
    when 2
      _book_ticket(bus_seats)
    when 3
      _cancel_ticket(bus_seats)
    when 4
      exit
    else
      puts 'Invalid choice'
  end
end