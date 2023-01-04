require_relative 'human_player'
require_relative 'computer_player'
require_relative 'board'
require_relative 'messages'
require_relative 'game_logic'
require 'pry-byebug'

class Game
  include Message
  include GameLogic
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

  def display_matches
    puts "\nThere were #{@computer.matches[0]} #{"EXACT".bold} Matches"
    puts "There were #{@computer.matches[1]} #{"PARTIAL".bold} Matches"
  end

  def create_players
    @human = HumanPlayer.create_player
    @computer = ComputerPlayer.new("Computer")
  end

  def player_guess_loop
    12.times do
      @human.place_guess
      @board.push_guess(@human.guess)
      assign_matches(@human, @computer.matches, @code)
      display_matches
      @board.populate_matches_array(@computer.matches)
      break end_game_human if game_won?(@human, @code)
      @human.clear_guess
      @computer.clear_matches
      @board.display_board
    end
  end

  def computer_guess_loop
    guess_number = 1
    until game_won?(@computer, @code)
      computer_thinking(guess_number)
      sleep(2)
      print "\nGuess number #{guess_number}: "
      @computer.make_guess
      @board.push_guess(@computer.guess)
      assign_matches(@computer, @computer.matches, @code)
      break end_game_computer if game_won?(@computer, @code)
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
