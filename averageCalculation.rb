puts 'Enter String with Integers'
str = gets.chomp
sum = 0
poscount = 0
negcount = 0
i = 0
if str.length >=1
  while i < str.length && (str[i].ord >= 48 && str[i].ord <= 57)
    sum = sum * 10 + str[i].to_i
    i += 1
  end
  if sum != 0
    poscount += 1
  end
end
while i < str.length
  if str[i].ord > 48 && str[i].ord <=57
    if str[i-1] != '-'
      loopsum = str[i].to_i
      i += 1
      while i < str.length && (str[i].ord >= 48 && str[1].ord <= 57)
        loopsum = loopsum*10 + str[i].to_i
        i += 1
      end
      sum += loopsum
      poscount += 1
    else
      negcount += 1
    end
  end
  i += 1
end
begin
  if str.length==0
    raise 'Empty Strings Are Not Allowed'
  elsif sum==0 && negcount==0
    raise 'String contains only characters or Special characters'
  elsif negcount==str.length/2
    raise 'String contains all Negative Numbers'
  elsif sum==0
    raise 'There are No Positive Numbers In the String'
  end
rescue Exception => e
  puts(e.message)
end
if sum!=0
  puts 'Average value is ' + (sum.to_f/poscount).to_s
end