module Dialogue

  def welcome
    puts "Welcome to Blackjack!"
    puts "What is your name?"
    puts
    return gets.chomp
  end

  def player_bets
    puts "#{@player.name}, you have Đ#{@player.doopals}"
    puts
    if @player.doopals < 100
      puts "Please bet between Đ1-#{@player.doopals}:" 
    else
      puts "Please bet between Đ1-100:"
    end
    
    gets.chomp.to_i
  end

  def invalid_bet
    system 'clear'
    puts "Invalid bet. Please try again."
    puts
  end

  # def print_cards(player)
  #   player.cards.each do |card|
  #     if player.class != Player && card.show == false
  #       9.times do |index|
  #         cards[index] += card.back[index]
  #       end
  #     else
  #       9.times do |index|
  #         cards[index] += card.front[index]
  #       end
  #     end
  #   end
  # end

  def show_table
    system 'clear'
    if !@hand_over
      @table.each do |player|
        puts "#{player.name}:"
        puts "Bet: #{player.bet}" unless player.class == Dealer
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
        puts cards
        puts "BUSTED." if player.bust
        puts "=" * cards[0].length
      end
    else
      @table.each do |player|
        puts "#{player.name}:"
        puts "Bet: #{player.bet}" unless player.class == Dealer
        cards = Array.new(9, "")

        player.cards.each do |card|
          9.times do |index|
            cards[index] += card.front[index]
          end
        end
        puts cards
        puts "#{player.name} has #{player.card_total} points."
        puts "BUSTED." if player.bust
        unless player.class == Dealer
          if winner?(player) && player.class != Dealer
            puts "#{player.name} WINS!"
            player.won = true
          elsif !winner?(player)
            puts "#{player.name} lost this hand." 
          end
        end
        puts "=" * cards[0].length
      end
    end
  end


end