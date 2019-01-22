# Create a class that makes numbers you put in pretty by adding commas

def insert_commas(number)
  number = number.to_s
  digits_left = number.length


  if digits_left < 4 
    return number
  elsif digits_left % 3 == 0
    comma_insert_index = 3
  elsif digits_left % 3 == 2
    comma_insert_index = 2
  else
    comma_insert_index = 1
  end

  until digits_left < 4
    if digits_left % 3 == 0
      number.insert(comma_insert_index, ",")
      comma_insert_index += 4
      digits_left -= 3
    elsif digits_left % 3 == 2
      number.insert(comma_insert_index, ",")
      comma_insert_index += 4
      digits_left -= 3
    else
      number.insert(comma_insert_index, ",")
      comma_insert_index += 4
      digits_left -= 3
    end
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