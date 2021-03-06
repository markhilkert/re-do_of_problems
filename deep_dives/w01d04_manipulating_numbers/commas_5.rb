def add_commas(number)
  number = number.to_s
  digits_left = number.length

  if digits_left % 3 == 0
    comma_insert_position = 3
  elsif digits_left % 3 == 1
    comma_insert_position = 1
  else
    comma_insert_position = 2
  end

  until digits_left < 4
    number = number.insert(comma_insert_position, ",")
    digits_left -= 3
    comma_insert_position += 4
  end
  return number
end

p add_commas(100)
p add_commas(100000)
p add_commas(1000000)
p add_commas(10000000)
p add_commas(1000000000000)
      