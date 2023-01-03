require_relative 'player'
require_relative 'game_logic'
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

class HumanPlayer < Player
  include GameLogic
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
    puts "Please select your guess from the colors: #{"Red".red}, #{"Green".green}, #{"Blue".blue}, #{"Yellow".yellow}, #{"Purple".magenta}, and #{"Cyan".cyan}"
    puts "Time to guess! Your guess should be four colors, separated by spaces, with no punctuation:"
    @guess = gets.chomp.downcase.split
    until guess_valid?(guess)
      puts "Invalid guess, please select a valid guess:"
      @guess = gets.chomp.downcase.split
    end
    puts "Your guess is: | #{color(@guess[0])} | #{color(@guess[1])} | #{color(@guess[2])} | #{color(@guess[3])} |"
  end

  def clear_guess
    @guess = nil
  end

  def assign_code
    puts "Please select your code from the colors: #{"Red".red}, #{"Green".green}, #{"Blue".blue}, #{"Yellow".yellow}, #{"Purple".magenta}, and #{"Cyan".cyan}"
    puts "Your code should be four colors, separated by spaces, with no punctuation:"
    code = gets.chomp.downcase.split
    until code_valid?(code)
      puts "Invalid selection, please select a valid code:"
      code = gets.chomp.downcase.split
    end
    puts "Your secret code is : | #{color(code[0])} | #{color(code[1])} | #{color(code[2])} | #{color(code[3])} |"
    puts "Don't tell the computer! :P"
    code
  end
end

