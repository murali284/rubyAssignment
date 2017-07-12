require './excelFunctions'
xcel = Array.new(10) {Array.new(10,0)}
puts('This is your excel Sheet')
_print_xcel(xcel)
while 1 do
  puts "Action List:\n1) Set Value\n2) Set Expression\n3) Exit\nEnter your action choice :"
  choice = gets.chomp.to_i
  case choice
    when 1
      puts 'Enter Set Value command :'
      _expression = gets.chomp
      _set_value(_expression,xcel)
      puts 'Set Value Command applied, your new board is'
      _print_xcel(xcel)
    when 2
      puts 'Enter Set Expression command :'
      _expression = gets.chomp
      _set_expression(_expression,xcel)
      puts 'Set Expression Command applied, your new board is'
      _print_xcel(xcel)
    when 3
      exit
    else
      puts('Invalid choice')
  end

end