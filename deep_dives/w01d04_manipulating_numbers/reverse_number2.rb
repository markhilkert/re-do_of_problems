def reverse_number(number)
  number = number.to_s
  reversed = ""

  number.length.times do |index|
    reversed[index] = number[number.length - 1 - index]
  end
  return reversed
end

# p reverse_number(123456789)
# p reverse_number(987654321)

def no_strings_reverse(number)
  reversed_array = []
  digits = (0..9).to_a
  place_value = 1
  reversed_number = 0

  until number == 0
    digits.each do |digit|
      if (number - digit * place_value) % (place_value * 10) == 0
        reversed_array << digit
        number -= (digit * place_value)
        place_value *= 10
      end
    end
  end

  reversed_array.length.times do |index|
    reversed_number += reversed_array[index] * 10 ** (reversed_array.length - index - 1)
  end
  return reversed_number
end

p no_strings_reverse(10529)