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
            p br_arr
            value = gets.chomp
            until is_free?(br_arr,value)
              puts "Try again"
              value = gets.chomp
            end
            mod_arr(br_arr,value,"X")
          else
            p br_arr
            puts question(players[1])
            value = gets.chomp
            until is_free?(br_arr,value)
              puts "Try again"
              value = gets.chomp
            end
            mod_arr(br_arr,value,"O")
          end
        end
    end


    protected

    def question (player)
        "#{ player } select your movement"    
    end

    def mod_arr(arr, position, val)
      arr[position.to_i-1] = val
      Board.render(arr)
    end

    def is_free? (arr,position)
      (arr[position.to_i-1] != "X" && arr[position.to_i-1] != "O")
    end
end