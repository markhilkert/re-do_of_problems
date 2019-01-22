def reverse_number(number)
  reverse_array = []
  reverse_number = 0
  place_holder = 1
  digits = (0..9).to_a

  until number == 0
    digits.each do |digit|
      if (number - digit * place_holder) % (place_holder * 10) == 0
        reverse_array << digit
        number -= digit * place_holder
        place_holder *= 10
      end
    end
  end

  reverse_array.length.times do |index|
    reverse_number += reverse_array[index] * 10 ** (reverse_array.length - index - 1)
  end
  return reverse_number
end

p reverse_number(123456789)