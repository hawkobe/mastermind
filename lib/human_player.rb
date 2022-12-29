require_relative 'player'

class HumanPlayer < Player
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]
  attr_reader :name, :guess, :code
  def initialize(name)
    super
    @guess = nil
    @code = nil
  end

  def self.create_player
    puts "Please enter your name:"
    name = gets.chomp
    puts "Thanks #{name}, you're all set up!"
    HumanPlayer.new(name)
  end

  def place_guess
    puts "Please select your guess from the colors: Red, Green, Blue, Yellow, Purple, and Cyan"
    puts "Time to guess! Your guess should be four colors, separated by spaces, with no punctuation:"
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

  def code_valid?(code)
    code.all? { |color| COLOR_OPTIONS.any?(color) }
  end

  def clear_guess
    @guess = nil
  end

  def assign_code
    puts "Please select your code from the colors: Red, Green, Blue, Yellow, Purple, and Cyan"
    puts "Your code should be four colors, separated by spaces, with no punctuation:"
    @code = gets.chomp.downcase.split
    until code_valid?(@code)
      puts "Invalid selection, please select a valid code:"
      @code = gets.chomp.downcase.split
    end
    puts "Your secret code is : | #{@code[0]} | #{@code[1]} | #{@code[2]} | #{@code[3]} |"
    puts "Don't tell the computer! :P"
  end
end

