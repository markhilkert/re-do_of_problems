# Initial Solution

def reverse_a_number(number)
  number_string = number.to_s
  number_array = number_string.chars
  reverse_array = []
  
  number_array.length.times do | count |
    reverse_array[ count ] = number_array[ number_array.length - 1 - count ]    
  end
  
reverse_string = reverse_array.join
reverse_integer = reverse_string.to_i

end

# "No Strings" solution

def reverse_a_number_no_strings(number)
  reversed_array = number.digits

  reversed_number = 0
  reversed_array.length.times do |count|
    reversed_number += (reversed_array[count] * 10 ** (reversed_array.length - count - 1))
  end

  return reversed_number

end

p reverse_a_number(673)


# Commit 4 - Refactor Solution



# Runner Code / Tests

puts reverse_a_number(67352193) == 39125376
puts reverse_a_number(97531) == 13579
puts reverse_a_number(24) == 42
puts reverse_a_number(1574362190881) == 1880912634751

puts reverse_a_number_no_strings(67352193) == 39125376
puts reverse_a_number_no_strings(97531) == 13579
puts reverse_a_number_no_strings(24) == 42
puts reverse_a_number_no_strings(1574362190881) == 1880912634751


