# look into Gosu for GUI version of board

class Board
  def initialize
    @board = []
    @matches = []
  end

  def display_board
    puts "Here's a history of your previous guesses:"
    @board.each_with_index do |guess_array, index| 
      print "Guess #{index + 1}: #{guess_array[0]} | #{guess_array[1]} | #{guess_array[2]} | #{guess_array[3]} |"
      puts " Exact matches: #{@matches[index][0]} ** Partial Matches: #{@matches[index][1]}"
    end
  end

  def populate_matches_array(exact, partial)
    @matches.push([exact, partial])
  end

  def push_guess(guess)
    @board.push(guess)
  end
end
