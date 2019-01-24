def generate_room()
grid = []
  6.times do
    row = []
    8.times do
      row << "¤"
    end
    grid << row
  end
  return grid
end

def print_room(room)
  # system "clear"

  room.each do |row|
    puts row.join("  ")
  end
  puts
  puts
end

room = generate_room
room[4][0] = "D"
room[0][0] = "S"
room[1][0] = "S"
room[1][4] = "S"
room[1][5] = "S"
room[2][2] = "S"
room[2][4] = "S"
room[2][5] = "S"
room[2][6] = "S"
room[3][2] = "S"
room[3][6] = "S"
room[4][2] = "S"
room[4][4] = "S"
room[5][4] = "S"
room[1][7] = "X"
print_room(room)


def horizontal_movement(x_starting_point=8,distance_travelled=0)
  return distance_travelled if x_starting_point == 0
  horizontal_movement(x_starting_point - 1,distance_travelled + 1)
end

def vertical_movement(y_starting_point,distance_travelled=0)
  return distance_travelled if y_starting_point == 0
  vertical_movement(y_starting_point.abs - 1,distance_travelled + 1)
end

def how_far(x,y)
  distance = horizontal_movement(x) + vertical_movement(y)
end

def valid_square?(x,y,room)
  if room[x][y] == "S"
    return false 
  else
    return true
  end
end


####### Runner Code #############

# p valid_square?(1,0,room)
# p valid_square?(5,4,room)
# p valid_square?(3,2,room)
# p valid_square?(0,1,room)
# p valid_square?(0,5,room)

p how_far(4,5)