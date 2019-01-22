

# Commit 1 - Initial Solution

def permutation_checker(base_word, possible_permutation)
  base_word = base_word.chars
  possible_permutation = possible_permutation.chars

  possible_permutation.each do |letter|
    if base_word.include?(letter)
      base_word.delete_at(base_word.index(letter))
    else
      return false
    end
  end
  return true
end

# Commit 4 - Refactored Solution



# Bonus 1 - Second Method

 # add bonus method here

# Commit 3 & 5 Runner Code

p permutation_checker("caliber", "eclair")
p permutation_checker("caliber", "bob")
p permutation_checker("caliber", "calberr")

