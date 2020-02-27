require_relative '../lib/board.rb'
require_relative '../lib/names.rb'
require_relative '../lib/welcome.rb'

class Input
  def ask_for_move(players, get_value, print)
    br_arr = %w[1 2 3 4 5 6 7 8 9]
    winner = false
    9.times do |x|
      Welcome.clear
      Welcome.print_message(print, &print)
      Board.render(br_arr, &print)
      (x % 2).zero? ? player_action(players[0], br_arr, 'X', get_value, &print) : player_action(players[1], br_arr, 'O', get_value, &print)
      break if winner

      Board.render(br_arr, &print) if x == 8
    end
  end

  protected

  def player_action(player_name, arr, val, get_value)
    yield question(player_name).green
    value = get_value.call
    until free?(arr, value) && in_range?(value)
      yield 'Give a valid movement'.red
      value = get_value.call
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
