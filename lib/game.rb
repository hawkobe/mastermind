# move push_guess and populate_matches_array to board class

require 'pry-byebug'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'board'

class Game
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]
  def initialize
    @board = Board.new
    @human = nil
    @computer = nil
    @current_player = nil
  end

  def setup
    welcome_message
    create_players
    @computer.assign_code
    breaker_message
  end

  def play
    setup
    player_guess_loop
  end

  def welcome_message
    puts "Welcome to Mastermind!\nYou will be competing against the computer to make and break codes!"
    puts "If you are not familiar with the rules of Mastermind,"
    puts "you can find the information here: https://en.wikipedia.org/wiki/Mastermind_(board_game)\n"
  end

  def breaker_message
    puts "Alright, the code has been chosen."
    puts "You have 12 turns to break the code!"
    puts "Please select your guess from the colors: Red, Green, Blue, Yellow, Purple, and Cyan"
  end

  def create_players
    @human = HumanPlayer.create_player
    @computer = ComputerPlayer.new("Computer")
    @current_player = @human
  end

  def player_guess_loop
    12.times do
      @current_player.place_guess
      @board.push_guess(@current_player.guess)
      @computer.assign_matches(@human)
      @board.populate_matches_array(@computer.matches)
      break end_game if @computer.game_won?(@human)
      @current_player.clear_guess
      @computer.clear_matches
      @board.display_board
    end
  end

  def end_game
    puts "You have guessed the code! YOU are the Mastermind!"
  end
end

game = Game.new

game.play
