class Superhero
  attr_reader :has_special_tool, :hitpoints, :name, :attack, :alive
  attr_writer :hitpoints, :attack, :alive

  def initialize(inputs)
    @name = inputs[:name]
    @hitpoints = inputs[:hitpoints]
    @has_special_tool = false
    @attack = inputs[:attack]
    @alive = true
  end

  def got_hit(damage)
    @hitpoints -= damage
    if @hitpoints < 1
      @alive = false
    end
  end 

  def hit(hero)
    hero.got_hit(@attack)
  end

  def grab_tool
    @has_special_tool = true
    @attack *= 3
  end

end

# Runner Code / Tests

# vvvvvvvvv don't touch any code below this line vvvvvvvvv

puts "TESTING the Superhero class..."
puts

superman = Superhero.new({name: "Superman", hitpoints: 45, attack: 3})
batman = Superhero.new({name: "Batman", hitpoints: 30, attack: 3})

puts "Testing Stats..."
puts

if superman.name == "Superman"
  puts "PASS!"
else
  puts "F"
end

if superman.hitpoints == 45
  puts "PASS!"
else
  puts "F"
end

if superman.alive == true
  puts "PASS!"
else
  puts "F"
end

if batman.name == "Batman"
  puts "PASS!"
else
  puts "F"
end

if batman.hitpoints == 30
  puts "PASS!"
else
  puts "F"
end

if batman.alive == true
  puts "PASS!"
else
  puts "F"
end
puts

puts "Stats..."
puts

puts "• #{superman.name} has #{superman.hitpoints} hitpoints"
puts "• #{batman.name} has #{batman.hitpoints} hitpoints"
puts 

puts "Superman hits Batman"
puts "Testing..."

superman.hit(batman)
puts "Batman's hitpoints are #{batman.hitpoints}"


if batman.hitpoints == 27
  puts "PASS!"
else
  puts "F"
end
puts


puts "Batman hits Superman"
puts "Testing..."

batman.hit(superman)
puts "Superman's hitpoints are #{superman.hitpoints}"


if superman.hitpoints == 42
  puts "PASS!"
else
  puts "F"
end
puts

puts "Checking Stats..."
puts
puts "• #{superman.name} has #{superman.hitpoints} hitpoints"
puts "• #{batman.name} has #{batman.hitpoints} hitpoints"
puts 


puts "Batman picks up Kryptonite (tool)"
puts "Testing..."

batman.grab_tool

if batman.has_special_tool == true
  puts "PASS!"
else
  puts "F"
end
puts


5.times do 
  puts "Batman hits Superman"
  batman.hit(superman)
  puts superman.hitpoints
end

puts "Testing..."
if superman.alive == false
  puts "PASS!"
else
  puts "F"
end
puts


puts "Checking Stats..."
puts
if superman.alive
  puts "• #{superman.name} has #{superman.hitpoints} hitpoints"
else
  puts "• Superman is dead."
end
puts "• #{batman.name} has #{batman.hitpoints} hitpoints"
puts 

# ^^^^^^^^^^ don't touch any code above this line ^^^^^^^^^^


