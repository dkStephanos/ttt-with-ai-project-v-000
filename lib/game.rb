class Game

  #Attributes
  attr_accessor :board, :player_1, :player_2
  #Enum describing each possible winning combination for the game
  WIN_COMBINATIONS = [
      [0,1,2],  # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # First column
      [1,4,7],  # Second column
      [2,5,8],  # Third column
      [0,4,8],  # First diagonal
      [2,4,6]   # Second diagonal
  ]

  #Initializer
  def initialize(player_1 = "X", player_2 = "O", board = Array.new(9, " "))
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


end
