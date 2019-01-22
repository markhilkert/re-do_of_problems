

def insert_commas(number)
  number = number.to_s
  digits_left = number.length

  if digits_left < 4
    return number
  elsif digits_left % 3 == 0
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


p insert_commas(3)
p insert_commas(30)
p insert_commas(300)
p insert_commas(3000)
p insert_commas(30000)
p insert_commas(300000)
p insert_commas(3000000)
p insert_commas(30000000)
p insert_commas(300000000)
p insert_commas(3000000000)