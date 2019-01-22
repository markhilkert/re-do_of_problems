# Commit 1 - Research

  # Question 1: The ljust, rjust, and center functions are useful for formatting strings on a page. If you need to add any characters (e.g., spaces) to the left of your test, use rjust, if you need to add characters to the right of your text, use ljust. If you would like to center your text, you're looking for center.
  # Question 2: This prints the string '*' 8 times, concatinated as a single string.
  # Question 3: This will print an empty line, and is useful for creating whitespace.


# Commit 1 - Psuedocode

  # Write psuedocode for each method

  # input: nothing
  # output: fancy (i.e., nicely formatted) report, reporting that the yard is clean, how many eggs were found, and the coordinates (x,y) of every egg found. For good measure, be sure to include a nice note at the end to the homeowner.

  # Steps
  # 1 - Create a yard that is a 14 x 11 grid, that either stores an egg or is clean grass
  # 2 - Store the number of eggs as you go through, taking note of every (x,y) coorindate that you pick up
  # 3 - Generate a report, nicely spaced and looking great, letting the homeowner know how it went and what eggs were cleaned up.

# Commit 4 - Initial Solution
def colorize(egg, color_code)
  "\e[#{color_code}m#{egg}\e[0m"
end

def random_color(egg)
  color_codes = (31..37).to_a
  colorize(egg, color_codes[rand(color_codes.length)])
end

def print_yard(yard)
  system "clear"

  yard.each do |row|
    puts row.join("  ")
  end

  sleep(0.6)
end

def collect_eggs(yard)
  eggs = {}
  egg_count = 1

  yard.each_with_index do |row, x|
    row.each_with_index do |spot, y|
      if spot != "G"
        eggs[egg_count] = [x,y]
        egg_count += 1
      end
    end
  end
  eggs[:egg_count] = egg_count
  return eggs
end

def egg_report(egg_basket)
  system "clear"

  puts "=" * 100
  puts "🥚" * 50
  puts "=" * 100
  puts " "
  puts "¡Yard Report!".center(100, ' ')
  puts " "
  puts "=" * 100
  puts "🥚" * 50
  puts "=" * 100

  puts "¡Congratulations! Your yard is now clean. ".center(100)
  puts "Egg Count: #{egg_basket[:egg_count]}".center(100)
  puts " "
  puts "We found your eggs in the following locations".center(100)
  puts "=" * 100
  egg_basket.each do |egg, coordinates|
    puts "Column: #{coordinates[1]}".rjust(50) + "  - Row: #{coordinates[0]}".ljust(100, " ")
  end

  puts "=" * 100
  puts "Fantastic! What a wonderful clean-up experience.".center(100)
  puts "Unfortunately your homeowners association has still decided to".center(100)
  puts "remove you from the community, effective immediately.".center(100)
  puts "If you do not comply, you will be removed forcefully.".center(100)
  puts "Have a wonderful day.".center(100)

  
  puts "=" * 100
  puts "🥚" * 50
  puts "=" * 100
end

def clean_yard(yard)
  basket = collect_eggs(yard)

  basket.each do |egg, coordinates|
    yard[coordinates[0]][coordinates[1]] = "G"
    print_yard(yard)
  end

  egg_report(basket)
end



# Commit 5 - Refactor Solution

  # copy and paste your initial solution here, comment out solution in the above section, then refactor the code in this section.

# Commit 3 - Write Runner Code

 # make your yard here

def generate_yard(egg_probability)
grid = []
  11.times do
    row = []
    14.times do
      if rand(1..100) < egg_probability
        row << random_color('E')
      else
        row << "G"
      end
    end
    grid << row
  end
  return grid
end

# call the clean_yard method here

yard = generate_yard(11)
clean_yard(yard)
