# Commit 1 - Psuedocode

 # psuedocode for initialize

 # psuedocode for sides

 # psuedocode for roll


# Commit 2 and 4 - Initial Solution

class Die
  attr_reader :sides, :face_up, :roll
  attr_writer :face_up

  def initialize(input_options)
    @sides = input_options[:sides]
    @face_up = rand(1..@sides)
  end

  def roll
    @face_up = rand(1..@sides)
  end
end

class DiceCup < Die
  attr_reader :total_dice

  def initialize(input_options)
    super(input_options)
    @total_dice = input_options[:total_dice]
    @dice = []

    @total_dice.times do 
      die = Die.new(sides: @sides)
      @dice << die
    end
  end

  def mega_roll
    @dice.each do |die|
      die.roll
    end
  end

  def faces_up
    faces_up = []
    @dice.each do |die|
      faces_up << die.face_up
    end
    return faces_up
  end
end


# die = Die.new(sides: 6)
# p die.face_up

dicecup = DiceCup.new(sides: 6, total_dice: 5)
p dicecup.faces_up
dicecup.mega_roll
p dicecup.faces_up




# Commit 3 - Write Runner Code / Tests

  # 
