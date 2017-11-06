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
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new())
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #Methods
  #Keeps track of the current player
  def current_player()
    current_turn = turn_count()
    if current_turn == 0 || current_turn % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  #Keeps track of the current turn
  def turn_count()
  current_turn = 0
  @board.each do |cell|
    if cell != " "
      current_turn += 1
    end
  end
  return current_turn
  end

  #Returns true if board is full
  def full?
    !@board.detect{|i| i == " "}
  end

  #Returns true if board is empty
  def empty?
    !@board.detect{|i| i == "X" || i == "O"}
  end

  #Returns true if the game is over
  def over?
    if won?
      return true
    elsif draw?
      return true
    else
      return false
    end
  end

  #Determines if current game has been won based upon the WIN_COMBINATIONS
  def won?
    if empty?
      return false
    end

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
    end
  end

  #Determines if game has ended in a draw
  def draw?
    if full?
      if !won?
        return true
      else
        return false
      end
    end
  end

  #Returns the winner of the game
  def winner
    if won?
      winner = won?
      return @board[winner[0]]
    else
      return nil
    end
  end

  #Initiates a turn by prompting for user input, and if valid, commiting the move
  def turn()
    player = @board.current_player()
    puts "Player #{player}, Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    is_valid = false
    until is_valid
      if valid_move?(index)
        move(index, player)
        display_board()
        is_valid = true
      else
        puts "Invalid Selection! Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
      end
    end
  end

  #Plays the game
  def play()
    while !over?()
      turn()
    end
    if won?()
      winning_player = winner()
      puts "Congratulations #{winning_player}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end



end
