# Hi everybody! Welcome to Mark's file. Sit down, enjoy yourself, browse some code.

class Card 

  attr_accessor :suit, :show, :name, :value, :back, :front

  def initialize(input_options)
    @suit = input_options[:suit]
    @name = input_options[:name]
    @value = input_options[:value]
    @show = true
  end

  def show_back
    puts ["┌───────────┐",
          "│░░░░░░░░░░░│",
          "│░░░░░░░░░░░│",
          "│░RUBY░░░░░░│",
          "│░░░BLACK░░░│",
          "│░░░░░░JACK░│",
          "│░░░░░░░░░░░│",
          "│░░░░░░░░░░░│",
          "└───────────┘"]
    end

  def show_front
    puts ["┌───────────┐",
          "│#{name.ljust(2)}         │",
          "│           │",
          "│           │",
          "│     #{suit}     │",
          "│           │",
          "│           │",
          "│         #{name.rjust(2)}│",
          "└───────────┘"]
  end
end

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    suits = ["♥", "♦", "♣", "♠"]
    values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    names = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

    suits.each do |suit|
      13.times do |index|
        @cards << Card.new(suit: suit, 
                          value: values[index], 
                          name: names[index]
                         )
      end
    end
    @cards.shuffle!
  end
end
