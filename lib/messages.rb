module Message
  def welcome_message
    <<~HEREDOC
      Welcome to Mastermind! You will be competing against the computer to make and break codes!
      If you are not familiar with the rules of Mastermind,
      you can find the information here: https://en.wikipedia.org/wiki/Mastermind_(board_game),
      but I will also explain the rules to you here.

      The game consists of two players:
        - A code MAKER, and
        - A code BREAKER
      
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
        If the maker's code was:    RED | GREEN | BLUE | YELLOW 
        and the breaker guessed:    RED | PURPLE | BLUE | CYAN 
        the maker would award the breaker 2 'exact matches' and NO 'partial matches':
        1 exact for RED and 1 exact for BLUE with no partial matches for PURPLE or CYAN 
        
        Or if the maker's code was: RED | GREEN | BLUE | YELLOW
        and the breaker guessed:    RED | YELLOW | RED | PURPLE
        the maker would award the breaker 1 'exact match' and 1 'partial match'
        1 exact for RED and 1 partial for YELLOW. As you can see, you don't recieve a partial match
        for the second RED because the only RED in the code already hit an exact match.

      The play then continues for 12 rounds, or until the breaker correctly
      guesses the code, whichever comes first. Good luck!

      HEREDOC

  end

  def breaker_message
    puts "Alright, the computer will choose the code."
    puts "You have 12 turns to break the code!"
  end

  def creator_message
    puts "The computer will have 12 turns to break the code."
  end

  def end_game
    puts "You have guessed the code! YOU are the Mastermind!"
  end
end