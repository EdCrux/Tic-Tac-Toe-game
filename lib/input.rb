require_relative "../lib/board.rb"
require_relative "../lib/names.rb"

class Input
    def initialize
        @arr_moves = []
    end
    def ask_for_move(players,br_arr)
        9.times do |x| 
          if x % 2 == 0
            puts question(players[0])
            value = gets.chomp
            br_arr[value.to_i-1] = "X"
            Board.render(br_arr)
          else
            puts question(players[1])
            value = gets.chomp
            p value
            br_arr[value.to_i-1] = "O"
            Board.render(br_arr)
          end
        end
    end

    def question (player)
        "#{ player } select your movement"    
    end
end