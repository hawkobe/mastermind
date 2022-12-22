require_relative 'player'

# need to create a history of guesses, which is essentially the board

class HumanPlayer < Player
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]
  attr_reader :name, :guess
  def initialize(name)
    super
    @guess = nil
  end

  def self.create_player
    puts "Please enter your name:"
    name = gets.chomp
    puts "Thanks #{name}, you're all set up!"
    HumanPlayer.new(name)
  end

  def place_guess
    puts "#{@name} Please make your four color guess, separated by spaces with no punctuation:"
    @guess = gets.chomp.downcase.split
    until guess_valid?(guess)
      puts "Invalid guess, please select a valid guess:"
      @guess = gets.chomp.downcase.split
    end
    puts "Your guess is: | #{@guess[0]} | #{@guess[1]} | #{@guess[2]} | #{@guess[3]} |"
  end

  def guess_valid?(guess)
    guess.all? { |color| COLOR_OPTIONS.any?(color) }
  end

  def clear_guess
    @guess = nil
  end
end

