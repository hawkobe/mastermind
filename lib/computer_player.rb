require_relative 'player'

class ComputerPlayer < Player
  def initialize(name)
    super
  end
  
  def determine_possible_combinations
    possible_combos = COLOR_OPTIONS.repeated_permutation(4).to_a
  end

  # need to write algorithm that lets computer make educated guesses
  # thinking along the lines of:
  
  # new_possibles = possible_combos.select { |array| array.count("red") <= 1 && array.count("green") <= 1}
  
  # based on first guess being "red red green green"
  # and partial matches = 1
end