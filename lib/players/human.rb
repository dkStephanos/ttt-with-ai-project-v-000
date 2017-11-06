class Players::Human < Player

  def move(board)
    puts "Player, Please enter 1-9:"
    input = gets.strip
    index = board.input_to_index(input)

    is_valid = false
    until is_valid
      if board.valid?(index)
        board.move(index, player)
        board.display
        is_valid = true
      else
        puts "Invalid Selection! Please enter 1-9:"
        input = gets.strip
        index = board.input_to_index(input)
      end
    end
  end

end
