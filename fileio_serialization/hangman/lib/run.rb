require_relative './hangman.rb'
require 'yaml'

if $PROGRAM_NAME == __FILE__
  hangman = Game.new
  hangman.start
end
