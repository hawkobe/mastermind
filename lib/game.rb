# need to create a game board

# need to make an array of colors the computer can select from
    # for each item in that array, have the computer randomly select
    # a color from it. (use .sample(4))

# need a way for the player to guess the code

# need something that keeps track of whether a guess is in the correct position,
# with the correct color, or whether there is a correct color, but not in the
# correct position (use .any?)

# need to keep track of rounds of play, so after 12 guesses the game is over

#


class Game
    def initialize
      @round = 1
      @selection_pool = ["red", "green", "blue", "yellow", "purple", "cyan"]
    end

    def check_code
        puts game_code
        color = gets.chomp
        @code.any?(color) 
    end

    def set_code
    end

    private
    attr_reader :code
    def game_code
        @code = []
        4.times { @code.push(@selection_pool.sample) }
    end

end

class Game
    def initialize
      @round = 1
      @selection_pool = ["red", "green", "blue", "yellow", "purple", "cyan"]
    end

    def check_code
        color = gets.chomp
        @code.any?(color) 
    end
    
    def game_code
        @code = []
        4.times { @code.push(@selection_pool.sample) }
    end

end

class Player
    def initialize
    end

    def guess
    end
end

class HumanPlayer < Player

end

class ComputerPlayer < Player

end