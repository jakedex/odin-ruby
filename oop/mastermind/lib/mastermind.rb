class Mastermind

  @@colors = ["red", "green", "blue",
            "yellow", "brown", "orange",
            "black", "white"]

  def initialize
    @board = Board.new
    @guess = ""
    @turn = 0
    @secretCode = gen_secret_code
  end

  def turn
    print "\nEnter your guess: "

    #input validation
    loop do
      @guess = gets.chomp.downcase.split

      break if @guess.all? {|color| @@colors.include? color}
      print "incorrect input, try again: "
    end

    #check for win
    win?

    #store guess and feedback
    @board.board[11-@turn] = @guess
    @board.feedback << get_feedback

    #print board/feedback
    @board.print_both

    @turn += 1
  end

  def play
    # intro
    puts "Welcome to mastermind. Attempt to guess the secret code in 12 turns."
    puts "The secret code consists of four of the following colors: Red, Green, Blue, Yellow, Brown, Orange, Black, White."
    puts "Here is the game board: \n\n"
    @board.print_board
    puts "\nAfter you make a guess, feedback is displayed on the right of the board."
    puts "Black (B) means that you guessed the correct color in the correct position."
    puts "White (W) means that you guessed the correct color in the incorrect position."

    # twelve turns
    12.times {turn}

    puts "\nGame over. Computer wins"
  end

  #black for e/ (correct color && correct position)
  #white for e/ (correct color)
  def get_feedback
    feedback = []
    #hold those that arent black
    checkForWhite = []

    #check black
    4.times do |index|
      if @guess[index] == @secretCode[index]
        feedback <<  "B"
      else
        checkForWhite << @secretCode[index]
      end
    end

    #check white
    checkForWhite.each do |color|
      feedback << "W" if @guess.include? color
    end

    feedback
  end

  def win?
    if @guess == @secretCode
      abort "Congrats, you won!"
    else
      return false
    end
  end

  # return array with randomly selected four colors
  def gen_secret_code
    secret_code = []
    4.times {secret_code << @@colors.sample}
    secret_code
  end

end
