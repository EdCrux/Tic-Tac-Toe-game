module Player

    def self.question(x)
        "Please enter the name of the #{x.zero? ? 'first' : 'second'}  player"
    end

    def self.ask_move(player,move,board,prints)
        until validate(move.to_i, board)
           move = prints.call(move.to_i)
        end
        move
    end

    def self.validate(move, arr)
        (move.between?(1, 9) && arr[move - 1] != 'X' && arr[move - 1] != 'O')
    end

end