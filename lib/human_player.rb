require_relative 'player'

class HumanPlayer < Player
  attr_reader :name
  def initialize(name)
    super
  end

  def self.create_player
    puts "Please enter your name:"
    name = gets.chomp
    puts "Thanks #{name}, you're all set up!"
    HumanPlayer.new(name)
  end
end