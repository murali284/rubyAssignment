def _print_seats(bus_seats)
  i=1
  print('-   ')
  ('A'..'J').each do |header|
    print("#{header}   ")
  end
  print("\n")
  for subArray in bus_seats do
    print("#{i}   ")
    for element in subArray do
      print("#{element}   ");
    end
    print("\n")
    i=i+1
  end
end

def _book_ticket(bus_seats)
  puts 'Enter no:of tickets'
  count = gets.chomp.to_i
  seats = []
  check = true
  puts 'Enter the selected seats'
  (0...count).each do |i|
    seats[i] = gets.chomp
    y = seats[i][0].ord - 65
    x = seats[i][1].to_i - 1
    if bus_seats[x][y] == 1
      check = false
    end
  end
  if check
    (0...count).each do |i|
      y = seats[i][0].ord - 65
      x = seats[i][1].to_i - 1
      bus_seats[x][y] = 1
      puts 'Selected seats are booked'
    end
  else
    puts 'Selected Seats are not available'
  end
end

def _cancel_ticket(bus_seats)
  puts 'Enter the seat to be cancelled'
  seat = gets.chomp
  y = seat[0].ord - 65
  x = seat[1].to_i - 1
  if bus_seats[x][y] == 1
    bus_seats[x][y] = ' '
    puts 'Selected seat is cancelled'
  else
    puts 'Selected seat is not booked'
  end
end


