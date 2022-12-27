# move push_guess and populate_matches_array to board class

require 'pry-byebug'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'board'

class Game
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]
  def initialize
    @board = Board.new
    @code = []
    @players = []
    @current_player = nil
    @exact_matches = 0
    @partial_matches = 0
  end

  def setup
    welcome_message
    create_players
    assign_code
    breaker_message
    @current_player = @players[0]
  end

  def play
    setup
    game_loop
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
    @players << HumanPlayer.create_player
    @players << ComputerPlayer.new("Computer")
    @current_player = @players[0]
  end
  
  def assign_matches
    matched = []
    partially_matched = []
    @current_player.guess.each_with_index do |color, index|
      if @current_player.guess[index] == @code[index]
        @exact_matches += 1
        matched.push(color)
      elsif code.any?(color) && matched.count(color) != @code.count(color) && partially_matched.count(color) != @code.count(color)
        @partial_matches += 1
        partially_matched.push(color)
      end

      if (matched.count(color) == partially_matched.count(color)) && ((matched.count(color) + partially_matched.count(color)) > code.count(color))
        @partial_matches -= 1
      end
      binding.pry
    end
  end

  def game_loop
    12.times do
      @current_player.place_guess
      @board.push_guess(@current_player.guess)
      assign_matches
      @board.populate_matches_array(@exact_matches, @partial_matches)
      break end_game if game_won?
      @current_player.clear_guess
      clear_matches
      @board.display_board
    end
  end

  def clear_matches
    @exact_matches = 0
    @partial_matches = 0
  end

  def game_won?
    @current_player.guess == @code
  end

  def end_game
    puts "You have guessed the code! YOU are the Mastermind!"
  end

  # private
  attr_reader :code, :players
  def assign_code
    4.times { @code.push(COLOR_OPTIONS.sample) }
  end
end

game = Game.new

game.play
