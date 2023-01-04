module GameLogic
  COLOR_OPTIONS = ["red", "green", "blue", "yellow", "purple", "cyan"]

  def guess_valid?(guess)
    guess.all? { |color| COLOR_OPTIONS.any?(color) } && guess.count == 4
  end

  def code_valid?(code)
    code.all? { |color| COLOR_OPTIONS.any?(color) }
  end

  def answer_valid?(response)
    response == "break" || response == "make"
  end

  def game_won?(player, code)
    player.guess == code
  end

  def assign_matches(player, match_array, code_to_check)
    matched = []
    partially_matched = []
    player.guess.each_with_index do |color, index|
      if player.guess[index] == code_to_check[index]
        match_array[0] += 1
        matched.push(color)
      end
    end
    player.guess.each_with_index do |color, index|
      if code_to_check.any?(color) && matched.count(color) < code_to_check.count(color) && partially_matched.count(color) < code_to_check.count(color) && player.guess[index] != code_to_check[index]
        match_array[1] += 1
        partially_matched.push(color)
      end
    end
  end

  def color(color)
    case color
    when "red"
      color.red
    when "blue"
      color.blue
    when "green"
      color.green
    when "yellow"
      color.yellow
    when "purple"
      color.magenta
    when "cyan"
      color.cyan
    end
  end
end
