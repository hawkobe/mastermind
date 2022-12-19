# need to create a game board

# need to make an array of colors the computer can select from
    # for each item in that array, have the computer randomly select
    # a color from it. (use .sample(4))

# need a way for the player to guess the code

# need something that keeps track of whether a guess is in the correct position,
# with the correct color, or whether there is a correct color, but not in the
# correct position (use .any?)

# need to keep track of rounds of play, so after 12 guesses the game is over

require_relative 'human_player'
require_relative 'computer_player'

class Game
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]
  def initialize
    @code = []
    @players = []
    @current_player = nil
    @current_guess = nil
  end

  def setup
    # call others methods like welcome, display_board, player_creation, number of even rounds to play
    welcome_message
    create_players
    assign_code
    breaker_message
  end

  def play
      
  end

  def welcome_message
    puts "Welcome to Mastermind!\nYou will be competing against the computer to make and break codes!"
    puts "If you are not familiar with the rules of Mastermind,"
    puts "you can find the information here: https://en.wikipedia.org/wiki/Mastermind_(board_game)"
  end

  def breaker_message
    puts "Alright, #{@current_player.name}, the code has been chosen."
    puts "You have 12 turns to break the code!"
  end

  def create_players
    @players << HumanPlayer.create_player
    @players << ComputerPlayer.new("Computer")
    @current_player = @players[0]
  end

  # def check_code
  #   puts game_code
  #   color = gets.chomp
  #   @code.any?(color) 
  # end

  def game_loop
      
  end


  def set_code
  end

  # private
  attr_reader :code, :selection_pool, :players
  def assign_code
    4.times { @code.push(@selection_pool.sample) }
  end
end

game = Game.new

game.setup
