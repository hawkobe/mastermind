require_relative 'player'
require 'pry-byebug'

class ComputerPlayer < Player
  include GameLogic
  attr_reader :guess, :matches
  def initialize(name)
    super
    @possible_combos = COLOR_OPTIONS.repeated_permutation(4).to_a
    @matches = [0, 0]
    @new_possibles = []
    @guess = nil
  end

  # need to refactor logic here for elsif statement
  
  def assign_matches(player, match_array, code_to_check)
    matched = []
    partially_matched = []
    player.guess.each_with_index do |color, index|
      if player.guess[index] == code_to_check[index]
        match_array[0] += 1
        matched.push(color)
      elsif code_to_check.any?(color) && matched.count(color) != code_to_check.count(color) && partially_matched.count(color) != code_to_check.count(color)
        match_array[1] += 1
        partially_matched.push(color)
      end

      if (matched.count(color) == partially_matched.count(color)) && ((matched.count(color) + partially_matched.count(color)) > code_to_check.count(color))
        match_array[1] -= 1
      end
    end
  end

  def remove_possible_codes
    @new_possibles = @possible_combos.select do |combo|
      current_matches = [0, 0]
      assign_matches(self, current_matches, combo)
      current_matches == @matches
    end
    @possible_combos = @new_possibles
  end

  def clear_matches
    @matches = [0, 0]
  end

  def assign_code
    COLOR_OPTIONS.sample(4)
  end

  def make_guess
    @new_possibles.empty? ? @guess = %w[red red green green] : @guess = @new_possibles.sample
    puts "The computers guess is: | #{color(@guess[0])} | #{color(@guess[1])} | #{color(@guess[2])} | #{color(@guess[3])} |"
  end
end