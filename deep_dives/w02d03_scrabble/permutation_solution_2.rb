def permutation_checker(base_word, possible_permutation)
  base_word = base_word.chars
  possible_permutation = possible_permutation.chars

  possible_permutation.each do |letter|
    base_word_index = base_word.index(letter)

    if base_word.include?(letter)
      base_word.delete_at(base_word_index)
    else
      return false
    end
  end
  return true
end

p permutation_checker("caliber", "eclair")
p permutation_checker("caliber", "bob")
p permutation_checker("caliber", "calberr")