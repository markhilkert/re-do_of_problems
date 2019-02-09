require_relative 'dealer'
require_relative 'dialogue'

class BlackJack
  include Dialogue
  attr_accessor :player, :cpu_1, :cpu_2, :dealer, :table, :game_over

  def initialize
    @player = Player.new
    @cpu_1 = ComputerPlayer.new
    @cpu_2 = ComputerPlayer.new
    @dealer = Dealer.new
    @table = [@player, @cpu_1, @cpu_2, @dealer]
    @players = [@player, @cpu_1, @cpu_2]
    @round_counter = 0
    @game_over = false
    @hand_over = false
  end

  def place_bets
    @round_counter += 1
    successful_bet = false

    until successful_bet
      @player.bet = player_bets
      highest_bet = @player.doopals < 100 ? @player.doopals : 100
      
      if @player.bet.between?(1,highest_bet)
        successful_bet = true
      else
        invalid_bet
      end
    end

    @player.doopals -= @player.bet
    @cpu_1.place_bet
    @cpu_2.place_bet
  end

  def initial_deal
    @table.each do |player|
      2.times do
        @dealer.deal_card(player)
      end
    end
  end

  def turn
    until @player.bust || @player.stay
      show_table
      puts
      puts "Your current total is #{@player.card_total}"
      puts "Hit or Stay?"
      answer = gets.chomp.downcase
      if answer[0] == 'h'
        @dealer.deal_card(@player)
      elsif answer[0] == 's'
        @player.stay = true
      end
    end
  end

  def computers_play
    show_table
    @table.each do |player|
      unless player.class == Player
        until player.stay == true
          @dealer.deal_card(player)
        end
      end
    end
    @hand_over = true
  end

  def show_all_cards
    @table.each { |player| player.cards[0].show = true }
  end

  def winner?(player)
    if player.bust 
      false
    elsif @dealer.bust && !player.bust
      true
    elsif player.card_total > @dealer.card_total
      true
    else
      false
    end
  end

  def pay_out
    @players.each do |player|
      player.doopals += 2 * player.bet if player.won
    end
  end

  def reset_variables
    @hand_over = false
    @table.each do |player|
      player.bust = false
      player.bet = 0
      player.won = false
      player.stay = false
      player.cards = []
      player.deck = Deck.new if player.class == Dealer
    end
  end

  def run_program
    system 'clear'
    @player.name = welcome
    until game_over
      system 'clear'
      place_bets
      initial_deal
      turn
      show_table
      # system 'clear'
      computers_play
      show_table
      pay_out
      reset_variables
      @players.each do |player|
        puts "#{player.name} has #{player.doopals} doopals."
      end
      gets
    end
  end

  # def round
  #   @table.each do |player|
  #     place_bets(player)
  #   end
  #   @table.each do |player|
  #     initial_deal(player)
  #   end
  #   @table.each do |player|
  #     turn(player)
  #   end
  # end
end

game = BlackJack.new
game.run_program

# game.table.each do |player|
#   if player.class != Dealer
#     p player 
#   end
# end
