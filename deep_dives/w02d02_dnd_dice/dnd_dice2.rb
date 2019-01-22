class Die
  attr_reader :face_up

  def initialize(input)
    @sides = input[:sides]
    @face_up = rand(1..@sides)
  end

  def roll
    @face_up = rand(1..@sides)
  end
end

die_1 = Die.new(sides:6)
die_2 = Die.new(sides: 6)
die_3 = Die.new(sides: 6)
die_4 = Die.new(sides: 6)
die_5 = Die.new(sides: 6)
die_6 = Die.new(sides: 6)
die_7 = Die.new(sides: 6)
die_8 = Die.new(sides: 6)
die_9 = Die.new(sides: 6)

class DiceCup
  attr_reader :dice

  def initialize(*dice)
    @dice = dice
  end

  def add_dice(*dice)
    @dice.concat(dice)
  end

  def faces_up
    faces = []

    @dice.each do |die|
      faces << die.face_up
    end
    return faces
  end

  def roll
    @dice.each do |die|
      die.roll
    end
    faces_up
  end

end

dice_cup = DiceCup.new(die_1, die_2, die_3)
dice_cup.add_dice(die_4, die_5, die_6)

p dice_cup.faces_up 
p "=" * 150
p dice_cup.roll

# p dice_cup.faces_up 