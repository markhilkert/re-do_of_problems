module Dialogue

  def welcome_dialogue
    puts "Welcome to Blackjack!"
    puts "What is your name?"
    puts
    return gets.chomp
  end

  def bet_dialogue
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

end