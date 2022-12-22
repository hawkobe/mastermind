# look into Gosu for GUI version of board

class Board
  attr_accessor :board
  def initialize
    @board = []
  end

  def display_board
    @board.each {|guess_array| p "#{guess_array[0]} | #{guess_array[1]} | #{guess_array[2]} | #{guess_array[3]} |"}
  end
end
