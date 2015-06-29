class Board
  attr_accessor :board, :feedback

  def initialize
    @board =  [["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"],
                  ["O", "O", "O", "O"]]
    @feedback = []
  end

  def print_board
    @board.each do |row|
      puts row.join(" | ")
    end
  end

  # print board and feedback
  def print_both
    feedbackIndex = 11
    @board.each do |row|
      #print row w/ feedback
      if @feedback.size - feedbackIndex > 0
        puts row.join(" | ") + " - [" + @feedback[feedbackIndex].join(" ") + "]"
      else
        puts row.join(" | ") + " "
      end
      feedbackIndex-=1
    end
  end
end
