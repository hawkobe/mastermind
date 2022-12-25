require_relative 'player'

class ComputerPlayer < Player
  def initialize(name)
    super
  end
  
  def determine_possible_combinations
    possible_combos = COLOR_OPTIONS.repeated_permutation(4).to_a
  end

  # red = 1 green = 2 blue = 3 yellow = 4 purple = 5 cyan = 6

  # need to write algorithm that lets computer make educated guesses.
  # thinking along the lines of:
  
  # if only partials and no exact matches:
  # use number of partials to determine "n"
  # new_possibles = possible_combos.select do |array| 
  #                   (array.count("red") <= n && array[0] != "red" && array[1] != "red") && (array.count("green") <= n && array[2] != "green" && array[3] != "green"

  
  # based on first guess being "red red green green"

  # will want computer to guess the lowest possible guess
  # from new possibles (e.g. [2, 3, 4, 5] over [3, 4, 5, 6])

  # possible outcomes of initial r r g g guess:
  # 1: four exact matches (win, so don't have to include)
  # 2: zero exact matches zero partials (eliminate those colors entirely from new possibles code)
  # 3: zero exact matches and 1 partial (if no exact, then -> [line 17])
  # 4: zero exact matches and 2 partial (if no exact, then -> [line 17])

end