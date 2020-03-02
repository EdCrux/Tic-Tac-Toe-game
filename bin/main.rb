#!/usr/bin/env ruby

require 'colorize'
require 'tty-screen'
require 'rubygems'
require_relative '../lib/board'

@width = TTY::Screen.width
@players = []
@board = %w[1 2 3 4 5 6 7 8 9]
@x = 0



def render(logo, arr = nil, color = :blue, on_color = :on_red)
  puts logo
  puts ''
  puts line(@width, '-')
  puts ''
  puts_board(@board,color, on_color)
end

def puts_board(boa,color, on_color)
  board = ui.print_board(boa, color, on_color)
  puts board.emptyLine
3.times do |x|
    board.rows[x].length.times do |y|
        print board.rows[x][y]
    end
    puts ""
    puts board.emptyLine
end
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
