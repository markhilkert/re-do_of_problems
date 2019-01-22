### Reverse numbers using strings

def reverse_number_using_strings(number)
  number = number.to_s
  reversed_number = ""

  number.length.times do |index|
    reversed_number[index] = number[-1 - index]
  end
  return reversed_number.to_i
end

p reverse_number_using_strings(54231)

def reverse_number_no_strings(number)
  reversed_array = []
  place_value = 1
  digits = (0..9).to_a
  reversed_number = 0

  until number == 0
    # p number
    digits.each do |digit|
      if (number - digit * place_value) % (place_value * 10) == 0
        reversed_array << digit
        number -= digit * place_value
        place_value *= 10
      end
    end
  end

  reversed_array.length.times do |index|
    reversed_number += reversed_array[index] * 10 ** (reversed_array.length - 1 - index)
  end

  return reversed_number
end

p reverse_number_no_strings(123456789)