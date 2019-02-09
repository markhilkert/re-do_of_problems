require_relative 'card.rb'

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    suits = ["♥", "♦", "♣", "♠"]
    values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    names = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

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
