class Game

  def initialize player1, player2
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @round = 0
  end

  def current_player
    @round % 2 == 0? @player1 : @player2
  end

  def turn
    puts "\nYour turn, #{current_player.name}. Enter the position (1-9) you'd like to move."
    @board.display

    #loop until location that hasn't been played is entered
    begin
      print "position: "
      location = gets.chomp.to_i
      location-=1 #adjust for array index
    end while @board.taken? location

    #move corresponding player
    @board.set_played location, current_player
    current_player.moves+=1
  end

  def play
    #game start
    puts "\nThe positions available to play are shown below."
    @board.display true

    #keep playing turns until winner or full
    begin
      @round+=1
      turn
    end while !@board.win? current_player || !@board.full?

    puts "Congrats #{current_player.name}, you won! It took you #{current_player.moves} moves."
  end

end
