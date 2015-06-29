require_relative './board.rb'
require_relative './mastermind.rb'
require_relative './run.rb'

if $PROGRAM_NAME == __FILE__
  game = Mastermind.new
  game.play
end
