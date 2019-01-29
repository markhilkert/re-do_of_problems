def insert_commas(number)
  number = number.to_s
  digits_left = number.length

  if number.length % 3 == 0
    comma_placement = 3
  elsif number.length % 3 == 1
    comma_placement = 1
  else
    comma_placement = 2
  end

  until digits_left < 4
    number = number.insert(comma_placement, ",")
    comma_placement += 4
    digits_left -= 3
  end
  return number
end

p insert_commas(100)
p insert_commas(1000)
p insert_commas(10000)
p insert_commas(100000)
p insert_commas(1000000)
p insert_commas(10000000)
p insert_commas(100000000)
p insert_commas(1000000000)