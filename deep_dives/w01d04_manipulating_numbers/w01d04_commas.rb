# Create a class that makes numbers you put in pretty by adding commas

def insert_commas(number)
  number = number.to_s
  number_of_digits = number.length


### Determine how many commas are needed
  if number_of_digits % 3 == 0
    number_of_commas = number_of_digits / 3 - 1
  else
    number_of_commas = number_of_digits / 3
  end

### Determine first position to insert comma
  if number_of_digits % 3 == 0 
    comma_position = 3
  elsif number_of_digits % 3 == 1
    comma_position = 1
  else
    comma_position = 2
  end

### Insert the commas
  number_of_commas.times do
    number = number.insert(comma_position, ',')
    comma_position += 4
  end
  
  return number
end

p insert_commas(300)
p insert_commas(3000)
p insert_commas(30000)
p insert_commas(300000)
p insert_commas(3000000)
p insert_commas(30000000)
p insert_commas(300000000)
p insert_commas(3000000000)