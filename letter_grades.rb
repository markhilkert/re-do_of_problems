def calculate_letter_grade(*grades)
  student_average = grades.sum / grades.length
  p {90 ... 100}
end

hash = {90..100 => "A"}

p [1,2,3,4,5,6,28,29,30].select{|num| num % 2 == 0 }

# p hash.select{ |score| score == 95 }

p calculate_letter_grade(65, 75, 85)
