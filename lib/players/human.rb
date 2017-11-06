class Players::Human < Player

  def move(board)
    puts "Player, Please enter 1-9:"
    input = gets.chomp
    index = board.input_to_index(input)

    is_valid = false
    until is_valid
      if board.valid?(index)
        is_valid = true
      else
        puts "Invalid Selection! Please enter 1-9:"
        input = gets.chomp
        index = board.input_to_index(input)
      end
    end
    input
  end

end
