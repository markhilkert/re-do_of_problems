# require 'benchmark'

### Practice Problem 1: Recursive factorial calculation

# def factorial(n)
#   return 1 if n == 1
#   n * factorial(n-1)
# end

# p factorial(5)




### Practice Problem 2: 

def append(array, number)
  return array if number < 0
  array << number
  append(array, number-1)
end

p append([],9)




# Commit 1 - Iterative Fibonacci Solution

def fibonacci_iterative(number)
  number_box = [0,1]

  return [0] if number == 1 
  return number_box if number == 2

  (number-2).times do 
    number_box << number_box[-1] + number_box[-2]    
  end

  return number_box
end

# p fibonacci_iterative(15)

# Commit 2 - Recursive Fibonacci Solution

def fibonacci_recursive(number)
  if number == 2
    return [0,1]
  end

  fibonacci_recursive(number-1) << (fibonacci_recursive(number-1)[-1] + fibonacci_recursive(number-1)[-2])
end

# p fibonacci_recursive(15)

# Runner Code

# p fibonacci_iterative(10) #=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# p fibonacci_iterative(8)  #=> [0, 1, 1, 2, 3, 5, 8, 13]

# p fibonacci_recursive(10) #=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# p fibonacci_recursive(11) #=> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# Commit 3 - Benchmark

# num_of_times = 1_000_000_000 
# Benchmark.bm do |x|
#   x.report { fibonacci_iterative(10) * num_of_times }
#   x.report { fibonacci_recursive(10) * num_of_times }
# end