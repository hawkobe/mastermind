require_relative 'player'

class ComputerPlayer < Player
  def initialize(name)
    super
    @match_array = []
  end
  
  def determine_possible_combinations
    possible_combos = COLOR_OPTIONS.repeated_permutation(4).to_a
  end

  def comp_assign_matches
    matched = []
    partially_matched = []
    @current_player.guess.each_with_index do |color, index|
      if @current_player.guess[index] == @code[index]
        @match_array[0] += 1
        matched.push(color)
      elsif code.any?(color) && matched.count(color) != @code.count(color) && partially_matched.count(color) != @code.count(color)
        @match_array[1] += 1
        partially_matched.push(color)
      end
    end
  end
  # red = 1 green = 2 blue = 3 yellow = 4 purple = 5 cyan = 6

  # need to write algorithm that lets computer make educated guesses.
  # thinking along the lines of:
  
  # if only partials and no exact matches:
  # use number of partials to determine "n"
  # new_possibles = possible_combos.select do |array| 
  #                   (array.count("red") <= n && array[0] != "red" && array[1] != "red") && (array.count("green") <= n && array[2] != "green" && array[3] != "green"

  
  # based on first guess being "red red green green"

  # for the next guess, will want computer to guess the lowest possible guess
  # from new possibles (e.g. [2, 3, 4, 5] over [3, 4, 5, 6])

  # possible outcomes of initial r r g g guess:
  # 1: four exact matches (win, so don't have to include)
  # 2: zero exact matches zero partials (eliminate those colors entirely from new possibles code)
  # 3: zero exact matches and 1 partial (if no exact, then -> [line 17])
  # 4: zero exact matches and 2 partial (if no exact, then -> [line 17])
  # 5: zero exact matches and 3 partial (if no exact, then -> [line 17])
  # 6: zero exact matches and 4 partial (if no exact, then -> [line 17])
  # 7: lkj
end