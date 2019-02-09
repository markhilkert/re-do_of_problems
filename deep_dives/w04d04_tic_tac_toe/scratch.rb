class Square
  attr_accessor :display
  
  def initialize
    @display = nil
  end

  def place_x
    self.display = "x ".red
  end

  def place_o
    self.display = "o ".cyan
  end
end

class TicTacToe
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

  def row_winner?
    @board.each do |row|
      if row[0].display && row[0].display == row[1].display && row[1].display == row[2].display
        @winner = true
        return true
      end
    end
    false
  end

end

game = TicTacToe.new
game.board[0][0].display = "x"
game.board[0][1].display = "x"
game.board[0][2].display = "x"
p game.row_winner?

### This works, so you should send it in.
