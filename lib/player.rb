module Player
  def self.question(item)
    "Please enter the name of the #{item.zero? ? 'first' : 'second'} player"
  end

  def self.ask_move(move, board, prints)
    move = prints.call until validate(move.to_i, board)
    move
  end

  def self.validate(move, arr)
    (move.between?(1, 9) && arr[move - 1] != 'X' && arr[move - 1] != 'O')
  end
end

