#!/usr/bin/env ruby

require 'colorize'
require 'tty-screen'
require 'rubygems'

@width = TTY::Screen.width
@players = []
@board = %w[1 2 3 4 5 6 7 8 9]
@x = 0

def getlogo
  logo = []
  logo << ' _____ _        _____            _____  '
  logo << '|_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___'
  logo << '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\'
  logo << '  | | | | (__    | | (_| | (__    | | (_) |  __/'
  logo << '  |_| |_|\\___|   |_|\\__,_|\\___|   |_|\\___/ \\___|'
  logo
end

def render(logo, arr = nil, color = :blue, on_color = :on_red)
  print_logo(logo)
  puts ''
  puts line(@width, '-')
  puts ''
  print_board(arr, color, on_color) unless arr.nil?
end

def clear
  if Gem.win_platform?
    system 'cls'
  else
    system 'clear'
  end
end

def color(mov)
  case mov
  when 'X'
    :blue
  when 'O'
    :green
  else
    :white
  end
end

def print_board(arr, color, on_color)
  puts line(13, '-').send(color)
  [0, 3, 6].each do |x|
    3.times do |y|
      print '|'.send(color)
      print arr[y + x].between?('1', '9') ? " #{arr[y + x]} ".send(on_color) : " #{arr[y + x]} ".send(color(arr[y + x]))
    end
    print '|'.send(color)
    puts ''
    puts line(13, '-').send(color)
  end
end

def print_logo(logo)
  logo.each do |line|
    color = rand(2..String.colors.length - 2)
    puts line.send(String.colors[color].to_sym)
  end
end

def line(width, sign)
  line = ''
  width.times do
    line << sign
  end
  line
end

render(getlogo)

2.times do |x|
  puts "Please enter the name of the #{x.zero? ? 'first' : 'second'}  player"
  player = gets.chomp
  until player.length.positive?
    puts 'Enter a valid name:'.red
    player = gets.chomp
  end
  @players << player
end

def draw(_board)
  return true if @x == 8
end

def winner
  false
end

def validate(move, arr)
  (move.between?(1, 9) && arr[move - 1] != 'X' && arr[move - 1] != 'O')
end

game_on = true
while game_on
  clear
  render(getlogo, @board, :green, :on_blue)
  if (@x % 2).zero?
    puts "#{@players[0]} select your move"
    move = gets.chomp
    until validate(move.to_i, @board)
      puts 'Give a valid move'.red
      move = gets.chomp
    end
    @board[move.to_i - 1] = 'X'
  else
    puts "#{@players[1]} select your move"
    move = gets.chomp
    until validate(move.to_i, @board)
      puts 'Give a valid move'.red
      move = gets.chomp
    end
    @board[move.to_i - 1] = 'O'
  end
  game_on = false if winner || draw(@board)
  @x += 1
end

clear
render(getlogo, @board, :green, :on_blue)
puts 'It is a draw!'
