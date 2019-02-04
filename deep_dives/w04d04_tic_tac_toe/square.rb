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
