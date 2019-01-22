require 'csv'
require 'json'

student_data = File.read("./raw_grade_data.csv")
student_grade_hash = {}

def calculate_letter_grade(*grades)
  student_mean = grades.sum / grades.length

  if student_mean > 89 then return "A"
  elsif student_mean > 79 then return "B"
  elsif student_mean > 69 then return "C"
  elsif student_mean > 59 then return "D"
  else return "F"
  end
end

### To write each students grade to a hash file

CSV.parse(student_data) do |row|
  raw_student_grades = row.slice(1..(row.length - 1))
  student_grades = raw_student_grades.map { |grade| grade.to_i }
  student_grade_hash[row[0]] = calculate_letter_grade(*student_grades)
  final_grade = File.new("final_grades.json", "w")
  final_grade.puts student_grade_hash.to_json
  final_grade.close
end

#### To display each student's grades in the terminal

student_grade_hash.each {|student, grade| puts "#{student} received an #{grade}."}


#### To write each student's grade back to a .csv

CSV.parse(student_data) do |row|
  raw_student_grades = row.slice(1..(row.length - 1))
  student_grades = raw_student_grades.map { |grade| grade.to_i }
  student_grade_hash[row[0]] = calculate_letter_grade(*student_grades)
  final_grade = File.new("final_grades.csv", "w")
  student_grade_hash.each {|student, grade| final_grade.puts "#{student}, #{grade}"}
  final_grade.close
end
