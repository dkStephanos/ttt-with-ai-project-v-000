class Board

  #Attributes
  attr_accessor :cells, :turn_count

  #Initializer
  def initialize
    @cells = Array.new(9, " ")
    @turn_count = 1
  end

  #Methods
  #Displays the Board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  #Determines whose turn it is
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  #Resets the current game Board
  def reset!
    @cells = Array.new(9, " ")
  end

  #Gets a position from the player for their move
  def position
    player = current_player()
    puts "Player #{player}, Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    @cells[index]
  end

  #Commits the move to the cells array
  def move(index, character)
    @cells[index] = character
    @cells
  end

  #Returns true if a given cells position is taken
  def taken?(index)
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
      false
    elsif @cells[index] == "X" || @cells[index] == "O"
      true
    end
  end

  #Returns true if there the requested move is valid
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  #Converts users input to index in board array
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  #Returns true if cells is full
  def full?
    !@cells.detect{|i| i == " "}
  end

  #Returns true if cells is empty
  def empty?
    !@cells.detect{|i| i == "X" || i == "O"}
  end

end
