class Board

  def initialize
    @played = [" ", " ", " "," ", " ", " "," ", " ", " "]
    @positions = [1,2,3,4,5,6,7,8,9]
  end

  def display(positions = false) #use `display true` for positions
    inputs = positions ? @positions : @played

    puts " #{inputs[0]} | #{inputs[1]} | #{inputs[2]}"
    puts "---|---|---"
    puts " #{inputs[3]} | #{inputs[4]} | #{inputs[5]}"
    puts "---|---|---"
    puts " #{inputs[6]} | #{inputs[7]} | #{inputs[8]}"
  end

  def win? player
    win_combos = [[0, 1, 2], [3, 4, 5],
                [6, 7, 8], [0, 3, 6],
                [1, 4, 7], [2, 5, 8],
                [0, 4, 8], [2, 4, 6]]
    win_combos.any? do |combo|
      combo.all? {|spot| @played[spot] == player.shape}
    end
  end

  def full?
    @played.none? {|i| i == " "}
  end

  def taken? index
    @played[index].nil?
  end

  def set_played index, player
    @played[index] = player.shape
  end
end
