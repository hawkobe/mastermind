require_relative 'human_player'
require_relative 'computer_player'
require_relative 'board'
require_relative 'messages'
require 'pry-byebug'

class Game
  include Message
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]
  def initialize
    @board = Board.new
    @human = nil
    @computer = nil
    @guess_or_create = nil
    @code = nil
  end

  def setup
    puts welcome_message
    create_players
    choose_guess_or_create
  end

  def play
    setup
    if @guess_or_create == "break"
      breaker_message
      @code = @computer.assign_code
      player_guess_loop
    else
      creator_message
      @code = @human.assign_code
      computer_guess_loop
    end
  end

  def choose_guess_or_create
    puts "Now decide whether you would like to BREAK the code or MAKE the code."
    puts "Type 'break' to guess the code, or 'make' to create the code:"
    answer = gets.chomp
    until answer_valid?(answer)
      puts "Invalid input. Remember, type 'break' to guess, or 'make' to create the code"
      answer = gets.chomp
    end
    puts "Great! You've chosen to #{answer}. Let's begin!"
    @guess_or_create = answer
  end

  def answer_valid?(response)
    response == "break" || response == "make"
  end

  def display_matches
    puts "There were #{@computer.matches[0]} Exact Matches"
    puts "There were #{@computer.matches[1]} Partial Matches"
  end

  def create_players
    @human = HumanPlayer.create_player
    @computer = ComputerPlayer.new("Computer")
  end

  def player_guess_loop
    12.times do
      @human.place_guess
      @board.push_guess(@human.guess)
      @computer.assign_matches(@human, @computer.matches, @code)
      display_matches
      @board.populate_matches_array(@computer.matches)
      break end_game if @computer.game_won?(@human, @code)
      @human.clear_guess
      @computer.clear_matches
      @board.display_board
    end
  end

  def computer_guess_loop
    guess_number = 1
    until @computer.game_won?(@computer, @code)
      print "Guess number #{guess_number}: "
      @computer.make_guess
      @board.push_guess(@computer.guess)
      @computer.assign_matches(@computer, @computer.matches, @code)
      display_matches
      @board.populate_matches_array(@computer.matches)
      @computer.remove_possible_codes
      @computer.clear_matches
      guess_number += 1
    end
  end
end

game = Game.new

game.play
