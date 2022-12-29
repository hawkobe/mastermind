require_relative 'player'
require 'pry-byebug'

class ComputerPlayer < Player
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]

  attr_reader :guess, :code
  attr_accessor :matches
  def initialize(name)
    super
    @possible_combos = COLOR_OPTIONS.repeated_permutation(4).to_a
    @matches = [0, 0]
    @code = []
    @new_possibles = []
    @guess = nil
  end

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

  def remove__possible_codes
    @new_possibles = @possible_combos.select do |combo|
      current_matches = [0, 0]
      assign_matches(self, current_matches, combo)
      # binding.pry
      # matched = []
      # partially_matched = []
      # @guess.each_with_index do |color, index|
      #   if @guess[index] == combo[index]
      #     current_matches[0] += 1
      #     matched.push(color)
      #   elsif combo.any?(color) && matched.count(color) != combo.count(color) && partially_matched.count(color) != combo.count(color)
      #     current_matches[1] += 1
      #     partially_matched.push(color)
      #   end

      #   if (matched.count(color) == partially_matched.count(color)) && ((matched.count(color) + partially_matched.count(color)) > combo.count(color))
      #     current_matches[1] -= 1
      #   end
      # end
      current_matches == @matches
    end
    @possible_combos = @new_possibles
  end

  def clear_matches
    @matches = [0, 0]
  end

  def assign_code
    @code = COLOR_OPTIONS.sample(4)
  end

  def game_won?(player, other_player)
    player.guess == other_player.code
  end

  def make_guess
    @new_possibles.empty? ? @guess = %w[red red green green] : @guess = @new_possibles.sample
  end

  def computer_game_loop
    assign_code
    guess_number = 1
    until game_won?(self)
      make_guess
      assign_matches(self, @matches, @code)
      # binding.pry
      computer_guess
      puts "Code: #{@code}"
      puts "Guess #{guess_number}: #{@guess}"
      clear_matches
      guess_number += 1
    end
  end
end

# computer = ComputerPlayer.new("computer")

# computer.game_loop