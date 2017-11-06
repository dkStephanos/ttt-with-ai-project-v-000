class Players::Human < Player

  def move(board)
    puts "Player, Please enter 1-9:"
    input = gets.chomp
    index = input.to_i - 1

    is_valid = false
    until is_valid
      if board.valid?(index)
        is_valid = true
      else
        puts "Invalid Selection! Please enter 1-9:"
        input = gets.chomp
        index = input.to_i - 1
      end
    end
    input
  end

end
