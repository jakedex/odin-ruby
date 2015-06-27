class Player
  attr_reader :name, :shape
  attr_accessor :moves
  $shape_change = 0

  def initialize name
    @name = name
    @moves = 0
    @shape = $shape_change == 0 ? "X" : "O"
    $shape_change += 1
  end
end
