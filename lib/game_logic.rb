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
