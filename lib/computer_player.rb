require_relative 'player'

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
    @guess = @new_possibles.empty? ? %w[red red green green] : @new_possibles.sample
    puts "The computers guess is: | #{color(@guess[0])} | #{color(@guess[1])} | #{color(@guess[2])} | #{color(@guess[3])} |"
  end
end
