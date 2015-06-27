require_relative './board.rb'
require_relative './game.rb'
require_relative './player.rb'

if $PROGRAM_NAME == __FILE__
  print "Welcome to Tic Tac Toe. Player 1, please enter your name: "
  player1 = gets.chomp
  print "and Player 2: "
  player2 = gets.chomp

  game = Game.new(Player.new(player1), Player.new(player2))
  game.play
end
