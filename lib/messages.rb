module Message
  def welcome_message
    <<~HEREDOC
      Welcome to Mastermind! You will be competing against the computer to make and break codes!
      If you are not familiar with the rules of Mastermind,
      you can find the information here: https://en.wikipedia.org/wiki/Mastermind_(board_game),
      but I will also explain the rules to you here.

      The game consists of two players:
        - A code #{'MAKER'.red.bold.underlined}, and
        - A code #{'BREAKER'.red.bold.underlined}

      The code MAKER sets a 4 color code (from a selection pool of 6 colors),
      and the code BREAKER then has 12 turns to guess the code the MAKER has chosen.

      After each guess from the breaker, the maker will give a response telling which colors the
      breaker guessed correctly, if any.

      The scoring goes as follows:
        - If the breaker got the correct color in the correct position, the maker will give them
          an 'EXACT MATCH'
        - If the breaker has a correct color, but in the incorrect position, the maker will give
          them a 'PARTIAL MATCH'

      FOR EXAMPLE:
        If the maker's code was:    #{'RED'.red} | #{'GREEN'.green} | #{'BLUE'.blue} | #{'YELLOW'.yellow}#{' '}
        and the breaker guessed:    #{'RED'.red} | #{'PURPLE'.magenta} | #{'BLUE'.blue} | #{'CYAN'.cyan}#{' '}
        the maker would award the breaker 2 'exact matches' and NO 'partial matches':
        1 exact for #{'RED'.red} and 1 exact for #{'BLUE'.blue} with no partial matches for #{'PURPLE'.magenta} or #{'CYAN'.cyan}#{' '}
      #{'  '}
        Or if the maker's code was: #{'RED'.red} | #{'GREEN'.green} | #{'BLUE'.blue} | #{'YELLOW'.yellow}
        and the breaker guessed:    #{'RED'.red} | #{'YELLOW'.yellow} | #{'RED'.red} | #{'PURPLE'.magenta}
        the maker would award the breaker 1 'exact match' and 1 'partial match'
        1 exact for #{'RED'.red} and 1 partial for #{'YELLOW'.yellow}. As you can see, you don't recieve a partial match
        for the second #{'RED'.red} because the only #{'RED'.red} in the code already hit an exact match.

      The play then continues for 12 rounds, or until the breaker correctly
      guesses the code, whichever comes first. Good luck!

    HEREDOC
  end

  def computer_thinking(round_number)
    case round_number
    when 1
      puts
      puts ["Okay let's give this a shot", 'First guess is the hardest, only easier from here',
            "Let's hope you picked a hard one!"].sample
    when 2..3
      puts
      puts ['Thinking..', "Let's try this!", 'Hmmm...', 'This oughta get me closer'].sample
    when 4
      puts
      puts ["Okay I didn't think it would be this hard", 'Getting closer...', "I've almost done it!"].sample
    else
      puts
      puts ['Oof! Tough one!', "I can't believe I haven't gotten it yet!", "You're smart, for a human..."].sample
    end
  end

  def end_game_computer
    puts 'I have broken your code, human! I never doubted myself for a second.'
  end

  def breaker_message
    puts 'Alright, the computer will choose the code.'
    puts 'You have 12 turns to break the code!'
  end

  def creator_message
    puts 'The computer will have 12 turns to break the code.'
  end

  def player_loss
    puts "You didn't break the code in 12 turns. Better luck next time!"
  end

  def end_game_human
    puts 'You have guessed the code! YOU are the Mastermind!'
  end

  def play_again_message
    puts 'Would you like to play again?'
    puts "Type 'Y' or 'y' to play again, or any other key to exit:"
  end
end
