require_relative 'square'
require 'colorize'

def clear_screen!
  system 'clear'
end

class Tic_tac_toe
  attr_accessor :board, :turns

  def initialize
     @board = [ 
                [ Square.new, Square.new, Square.new ],
                [ Square.new, Square.new, Square.new ],
                [ Square.new, Square.new, Square.new ]
              ]
     @winner = false
     @turn = 1
  end

  def display_board
    puts "╔=======╗".white
    @board.each do |row|
      formatted_row = "║ ".white
      row.each do |square|
        if square.display
          formatted_row += square.display
        else
          formatted_row += "_ ".white
        end
      end

      puts formatted_row + "║".white
    end
    puts "╚=======╝".white
  end

  def update
    puts "Please select 1st 2nd or 3rd row: "
    selected_row = gets.chomp.to_i - 1
    puts "Please select 1st 2nd or 3rd column: "
    selected_column = gets.chomp.to_i - 1

    if selected_row.between?(0,2) && selected_column.between?(0,2)
      selected_square = @board[selected_row][selected_column]
    else
      clear_screen!
      puts
      puts "Invalid square. Please select another."
      puts
      update
    end

    if selected_square.display == nil
      if @turn.even? == false
        selected_square.place_x
        @turn += 1
      else
        selected_square.place_o
        @turn += 1
      end
    else
      clear_screen!
      p "DANGER WILL ROBINSON"
      puts
      puts "Invalid square. Please select another."
      gets
      display_board
    end
  end

  def winner?
    @board.each do |row|
      if row[0].display && row[0].display == row[1].display && row[1].display == row[2].display
        @winner = true
        return true
      end
    end
    
    3.times do |index|
      @board[0][index].display
      if @board[0][index].display && @board[0][index].display == @board[1][index].display && @board[1][index].display == @board[2][index].display
        @winner = true
        return true
      end
    end

    if @board[0][0].display && @board[0][0].display == @board[1][1].display && @board[1][1].display == @board[2][2].display
      @winner = true
      return true
    elsif @board[0][2].display && @board[0][2].display == @board[1][1].display && @board[1][1].display == @board[2][0].display
      @winner = true
      return true
    end      
    return false
  end

  def run_program
    puts "Welcome to Tic Tac Toe! Player 1 starts the game by placing an x."
    puts
    puts "Press any key to continue"
    gets

    until @turn == 10
      clear_screen!
      display_board
      update
      if winner?
        display_board
        break
      end
    end
    
    puts "Player 1 wins!" if @winner && @turn.even?
    puts "Player 2 wins!" if @winner && @turn.even? == false
    puts "Cat's game." unless @winner
  end   
end

game = Tic_tac_toe.new
game.run_program
