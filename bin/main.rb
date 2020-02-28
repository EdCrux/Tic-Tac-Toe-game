#!/usr/bin/env ruby

require 'colorize'
require 'tty-screen'
require 'rubygems'

module Message
  @mes = {}
  @width = TTY::Screen.width
  def self.message
    @mes[:welcome] = welcome
    @mes[:logo] = logo
    @mes[:div_line] = div_line('-', @width)
    @mes
  end

  def self.newline(line_nr = 1)
    line_nr.times { yield '' }
  end

  def self.welcome
    'Dear users, welcome!'
  end

  def self.logo
    logo = []
    logo << ' _____ _        _____            _____  '
    logo << '|_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___'
    logo << '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\'
    logo << '  | | | | (__    | | (_| | (__    | | (_) |  __/'
    logo << '  |_| |_|\\___|   |_|\\__,_|\\___|   |_|\\___/ \\___|'
    logo
  end

  def self.div_line(*type)
    temp_string = ''
    type[1].times { temp_string << type[0] } if type.length == 2
    temp_string
  end
end

class Input
  def initialize
    @x = 0
  end

  def ask_for_move(players, get_value, print)
    br_arr = %w[1 2 3 4 5 6 7 8 9]
    game_on = true
    while game_on
      Welcome.clear
      Welcome.print_message(print, &print)
      Board.render(br_arr, &print)
      if (@x % 2).zero?
        action(players[0], br_arr, 'X', get_value, &print)
      else
        action(players[1], br_arr, 'O', get_value, &print)
      end
      game_on = false if winner || draw
      Board.render(br_arr, &print) if @x == 8
      @x += 1
    end
  end

  protected

  def winner
    false
  end

  def draw
    return true if @x == 8
  end

  def action(player_name, arr, val, get_value)
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
    ((1..9) == position.to_i)
  end
end

class Welcome
  def self.print_message(print)
    width = TTY::Screen.width
    @message = Message.message
    Message.newline(2, &print)
    @message[:logo].each do |x|
      col = rand(2..String.colors.length - 2)
      yield(x.send(String.colors[col].to_sym))
    end

    Message.newline(2, &print)
    yield(@message[:welcome].center(width))
    Message.newline(1, &print)
    yield(@message[:div_line].blue.center(width))
    Message.newline(1, &print)
  end

  def self.clear
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
  end
end

module Board
  def self.render(move)
    width = TTY::Screen.width
    count = 0

    3.times do
      a = " #{move[0 + count].send(color(move[0 + count]))} | #{move[1 + count].send(color(move[1 + count]))} "
      a << "| #{move[2 + count].send(color(move[2 + count]))}"
      yield a.center(width + 40)
      yield '-----------'.center(width) if count < 6
      count += 3
    end
  end

  def self.color(mov)
    case mov
    when 'X'
      :blue
    when 'O'
      :green
    else
      :white
    end
  end
end

class Names
  def initialize
    @arr_players = []
  end

  def ask_player(bli, number = 2)
    number.times do |x|
      yield(question(x + 1))
      value = bli.call
      until value.length.positive?
        yield 'Give a valid name: '.red
        value = bli.call
      end
      @arr_players << value.capitalize
    end
  end

  def question(number)
    "Please enter the name of the #{number == 1 ? 'first' : 'second'} player"
  end

  def players
    @arr_players
  end
end

print = proc { |x| puts x }
get_value = -> { return gets.chomp }

Welcome.clear
Welcome.print_message(print, &print)

a = Names.new
a.ask_player(get_value, &print)

input = Input.new
input.ask_for_move(a.players, get_value, print)
