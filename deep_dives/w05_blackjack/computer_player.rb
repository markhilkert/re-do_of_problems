require_relative 'player.rb'

class ComputerPlayer < Player
  @@computer_count = 0
  
  def initialize
    computer_names = ("A".."G").to_a.map { |letter| letter + " Bot"}
    @name = computer_names[@@computer_count]
    @@computer_count += 1
    super
  end

  def add_cards(card)
    super
    if calc_card_total > 16
      @stay = true
    end
  end

  def place_bet
    if @doopals > 50
      @bet = rand(25..50)
    else
      @bet = rand(1..@doopals)
    end
    @doopals -= @bet
  end

end