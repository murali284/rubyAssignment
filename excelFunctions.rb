$expr_array = {}
def _print_xcel(xcel)
  i=0
  print('-   ')
  ('A'..'J').each do |header|
    print("#{header}   ")
  end
  print("\n")
  for subArray in xcel do
    print("#{i}   ")
    for element in subArray do
      print("#{element}   ");
    end
    print("\n")
    i=i+1
  end
end

def _set_value(_expression,_xcel)
  position = _expression.split(' ').first
  value = _expression.split(' ').last.to_i
  if _xcel[position[1].to_i][position[0].ord-65] == 0
    _xcel[position[1].to_i][position[0].upcase.ord-65] = value
  else
    _xcel[position[1].to_i][position[0].upcase.ord-65] = value
    _check(position,_xcel)
  end
end

def _set_expression(_expression,_xcel)
  $expr_array[_expression.split(' ').first] = _expression
  arr = _expression.split(' ')
  var = Array.new(3,0)
  val = Array.new(3,0)
  k = 0
  (0...arr.length).each do |i|
    if i%2 == 1
      next
    end
    var[k] = (arr[i][0].upcase.ord)-65
    val[k] = arr[i][1].to_i
    k=k+1
  end
  operator = arr[3]
  if _xcel[val[0]][var[0]] == 0
    _perform_operation(_xcel,var[0],val[0],var[1],val[1],var[2],val[2],operator)
  else
    _perform_operation(_xcel,var[0],val[0],var[1],val[1],var[2],val[2],operator)
    _check(arr[0],_xcel)
  end
end

def _perform_operation(_xcel,x,y,a,b,c,d,operator)
  case operator
    when '+'
      _xcel[y][x] = _xcel[b][a] + _xcel[d][c]
    when '-'
      _xcel[y][x] = _xcel[b][a] - _xcel[d][c]
    when '*'
      _xcel[y][x] = _xcel[b][a] * _xcel[d][c]
    when '/'
      _xcel[y][x] = _xcel[b][a] / _xcel[d][c]
    when '**'
      _xcel[y][x] = _xcel[b][a] ** _xcel[d][c]
      return _xcel
    else
      return _xcel
  end
end

def _check(position,_xcel)
  arr1 = $expr_array.values
  (0..arr1.length).each do |i|
    arr2 = arr1[i].to_s.split(' ')
    if position == arr2[2] || position == arr2[4]
      _set_expression(arr1[i],_xcel)
    end
  end
end
