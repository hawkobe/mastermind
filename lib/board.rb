require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require_relative 'game_logic'

class Board
  include GameLogic
  def initialize
    @board = []
    @matches = []
  end

  def display_board
    puts "Here's a history of the previous guesses:"
    @board.each_with_index do |guess_array, index| 
      print "Guess #{index + 1}: #{color(guess_array[0])} | #{color(guess_array[1])} | #{color(guess_array[2])} | #{color(guess_array[3])} |"
      puts " Exact matches: #{@matches[index][0]} ** Partial Matches: #{@matches[index][1]}"
    end
  end

  def populate_matches_array(match_array)
    @matches.push(match_array)
  end

  def push_guess(guess)
    @board.push(guess)
  end
end
