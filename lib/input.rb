require_relative '../lib/board.rb'
require_relative '../lib/names.rb'
require_relative '../lib/welcome.rb'

class Input
  def ask_for_move(players)
    br_arr = %w[1 2 3 4 5 6 7 8 9]
    9.times do |x|
      Welcome.clear
      Welcome.print_message
      Board.render(br_arr)
      (x % 2).zero? ? player_action(players[0], br_arr, 'X') : player_action(players[1], br_arr, 'O')
      Board.render(br_arr) if x == 8
    end
  end

  protected

  def player_action(player_name, arr, val)
    puts question(player_name).green
    value = gets.chomp
    until free?(arr, value) && in_range?(value)
      puts 'Give a valid movement'.red
      value = gets.chomp
    end
    mod_arr(arr, value, val)
  end

  def question(*player)
    "#{player} select your movement"
  end

  def mod_arr(arr, position, val)
    arr[position.to_i - 1] = val
  end

  def free?(arr, position)
    (arr[position.to_i - 1] != 'X' && arr[position.to_i - 1] != 'O')
  end

  def in_range?(position)
    ((1..9) === position.to_i)
  end
end
