require_relative 'dealer'
require_relative 'dialogue'

class BlackJack
  include Dialogue
  attr_accessor :player, :dealer, :table, :players, :game_over

  def initialize
    @player = Player.new
    cpu_1 = ComputerPlayer.new
    cpu_2 = ComputerPlayer.new
    @dealer = Dealer.new
    @non_dealers = [@player, cpu_1, cpu_2]
    @table = [@player, cpu_1, cpu_2, @dealer]
    @game_over = false
    @hand_over = false
  end

  def reset_table
    @game_over = true if @player.in == false
    @table.each_with_index do |player, index|
      if player.in == false && player.class == ComputerPlayer
        @table.delete_at(index)
        @non_dealers.delete_at(index)
      end
    end
  end

  def player_bets
    successful_bet = false

    until successful_bet
      @player.bet = bet_dialogue
      highest_bet = @player.doopals < 100 ? @player.doopals : 100
      
      @player.bet.between?(1,highest_bet) ? successful_bet = true : invalid_bet
    end

    @player.doopals -= @player.bet
  end

  def computers_bet
    @table.each do |player|
      player.place_bet if player.class == ComputerPlayer
    end
  end

  def initial_deal
    @table.each do |player|
      2.times do
        @dealer.deal_card(player)
      end
    end
  end

  def player_plays
    until @player.bust || @player.stay
      show_table
      hit_dialogue
      answer = gets.chomp.downcase
      if answer[0] == 'h'
        @dealer.deal_card(@player)
      elsif answer[0] == 's'
        @player.stay = true
      end
    end
    show_table
    puts "Press any key to see the rest of the table play"
    gets
  end

  def computers_play
    show_table
    @table.each do |player|
      unless player.class == Player
        until player.stay == true
          @dealer.deal_card(player)
          show_table
          puts "#{player.name} Hits!"
          sleep(2)
        end
        puts "#{player.name} stays."
        sleep(1)
      end
    end
    @hand_over = true
  end

  def printify_cards(player)
    cards = Array.new(9, "")

    player.cards.each do |card|
      if player.class != Player && card.show == false
        9.times do |index|
          cards[index] += card.back[index]
        end
      else
        9.times do |index|
          cards[index] += card.front[index]
        end
      end
    end
    cards
  end

  def finish_hand(player)
    puts "#{player.name} has #{player.card_total} points."
    unless player.class == Dealer
      if winner?(player) && player.class != Dealer
        puts "#{player.name} WINS!"
        player.won = true
      elsif !winner?(player)
        puts "#{player.name} lost this hand." 
      end
    end
  end

  def show_table
    system 'clear'
    @table.each do |player|
      puts "#{player.name}:"
      puts "Bet: #{player.bet}" unless player.class == Dealer

      cards = printify_cards(player)

      puts cards
      puts "BUSTED." if player.bust

      if @hand_over
        finish_hand(player)
      end
      puts "=" * cards[0].length
    end
  end

  def all_cards_face_up
    puts "Press any key to show everyone's cards"
    gets
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
    @non_dealers.each do |player|
      player.doopals += 2 * player.bet if player.won
      player.in = false if player.doopals == 0
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
    @player.name = welcome_dialogue
    until game_over
      system 'clear'
      player_bets
      computers_bet
      initial_deal
      player_plays
      show_table
      computers_play
      all_cards_face_up
      show_table
      pay_out
      reset_table
      reset_variables
      @non_dealers.each do |player|
        puts "#{player.name} has #{player.doopals} doopals."
      end
      gets
    end
    puts "YOU LOSE."
  end

end

game = BlackJack.new
game.run_program

