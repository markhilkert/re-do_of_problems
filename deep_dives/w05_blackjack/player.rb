class Player
  attr_accessor :doopals, :bust, :cards, :stay, :bet, :in, :name, :won
  attr_reader :card_total

  def initialize
    @doopals = 80
    @bust = false
    @card_total = 0
    @cards = []
    @stay = false
    @in = true
    @won = false
  end

  def add_cards(card)
    card.show = false if @cards == []
    @cards << card
    
    if calc_card_total == 21
      @stay = true
    elsif calc_card_total > 21
      @bust = true
    end
  end

  def ace
    @cards.each_with_index do |card, index|
      if card.name == 'Ace' && card.value == 11
        return index
      end
    end
    false
  end

  def calc_card_total
    @card_total = @cards.sum { |card| card.value }
    index_of_ace = ace

    if @card_total > 21 && index_of_ace
      @cards[index_of_ace].value = 1
    end

    @card_total
  end

  def toggle_bust
    @bust = !@bust
  end

  def place_bet(bet_amount)
    if bet_amount <= @doopals
      @bet = bet_amount
      @doopals -= bet_amount
      return @bet
    else
      return false
    end
  end
end