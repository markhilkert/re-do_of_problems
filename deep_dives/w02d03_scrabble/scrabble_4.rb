def scrabble_helper(base_word, permutation)
  base_word = base_word.downcase.chars
  permutation = permutation.downcase.chars

  permutation.each do |letter|
    if base_word.include?(letter)
      base_word.delete_at(base_word.index(letter))
    else
      return false
    end
  end
  return true
end

p scrabble_helper("caliber", "eclair")
p scrabble_helper("caliber", "bill")