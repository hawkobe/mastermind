require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require_relative 'human_player'
require_relative 'game_logic'
require_relative 'messages'
require_relative 'player'
require_relative 'computer_player'
require_relative 'game'
require_relative 'board'

Game.new.play