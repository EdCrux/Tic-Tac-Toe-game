require_relative "../lib/board.rb"
require_relative "../lib/names.rb"

class Input
    def initialize
        @arr_moves = []
    end
    def ask_for_move(players,br_arr)
        9.times do |x| 
          if x % 2 == 0
            puts question(players[0]).blue
            value = gets.chomp
            until is_free?(br_arr,value) && in_range?(value)
                puts "Give a valid movement".red
              value = gets.chomp
            end
            mod_arr(br_arr,value,"X")
          else

            puts question(players[1]).green
            value = gets.chomp
            until is_free?(br_arr,value) && in_range?(value)
              puts "Give a valid movement".red
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

    def in_range? (position)
        ((1..9) === position.to_i) 
    end
end