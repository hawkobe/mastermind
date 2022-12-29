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
    @guess_or_create = nil
  end

  def setup
    welcome_message
    create_players
    choose_guess_or_create
  end

  def play
    setup
    if @guess_or_create == "guess"
      breaker_message
      player_guess_loop
    else
      creator_message
      computer_guess_loop
    end
  end

  def choose_guess_or_create
    puts "Now decide whether you would like to guess the code or create the code."
    puts "Type 'guess' to guess or 'code' to create the code:"
    answer = gets.chomp
    until answer_valid?(answer)
      puts "Invalid input. Remember, type 'guess' to guess or 'code' to create the code"
      answer = gets.chomp
    end
    puts "Great! You've chosen to #{answer}. Let's begin!"
    @guess_or_create = answer
  end

  def answer_valid?(response)
    response == "guess" || response == "code"
  end

  def welcome_message
    puts "Welcome to Mastermind!\nYou will be competing against the computer to make and break codes!"
    puts "If you are not familiar with the rules of Mastermind,"
    puts "you can find the information here: https://en.wikipedia.org/wiki/Mastermind_(board_game)\n"
  end

  def breaker_message
    puts "Alright, the computer will choose the code."
    puts "You have 12 turns to break the code!"
  end

  def creator_message
    puts "The computer will have 12 turns to break the code."
  end

  def display_matches
    puts "You got #{@computer.matches[0]} Exact Matches"
    puts "You got #{@computer.matches[1]} Partial Matches"
  end

  def create_players
    @human = HumanPlayer.create_player
    @computer = ComputerPlayer.new("Computer")
  end

  def player_guess_loop
    @computer.assign_code
    12.times do
      @human.place_guess
      @board.push_guess(@human.guess)
      @computer.assign_matches(@human, @computer.matches, @computer.code)
      display_matches
      @board.populate_matches_array(@computer.matches)
      break end_game if @computer.game_won?(@human, @computer)
      @human.clear_guess
      @computer.clear_matches
      @board.display_board
    end
  end

  def computer_guess_loop
    @human.assign_code
    guess_number = 1
    until @computer.game_won?(@computer, @human)
      @computer.make_guess
      @computer.assign_matches(@computer, @computer.matches, @human.code)
      @computer.remove__possible_codes
      puts "Guess #{guess_number}: #{@computer.guess}"
      @computer.clear_matches
      guess_number += 1
    end
  end

  def end_game
    puts "You have guessed the code! YOU are the Mastermind!"
  end
end

game = Game.new

game.play
