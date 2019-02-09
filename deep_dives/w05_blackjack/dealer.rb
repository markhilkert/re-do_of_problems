require_relative 'computer_player.rb'
require_relative 'deck.rb'

class Dealer < ComputerPlayer
  attr_accessor :deck 
  def initialize
    super
    @doopals = 1000000000
    @deck = Deck.new
    @name = "Dealer Bot"
    @won = true
  end

  def deal_card(player)
    card = @deck.cards.pop
    player.add_cards(card)
  end

  def place_bet
    puts "Dealers doesn't bet, silly goose."
  end
end

dylan = Dealer.new
