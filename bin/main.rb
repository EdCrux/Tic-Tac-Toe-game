#!/usr/bin/env ruby

require 'colorize'
require 'tty-screen'
require 'rubygems'
require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/assets'
require_relative '../lib/ui'
require_relative '../lib/logic'

@width = TTY::Screen.width
@players = []
@board = %w[1 2 3 4 5 6 7 8 9]
@x = 0

@ui = Ui.new

def render(arr = nil, color = :blue, on_color = :on_red)
  puts @ui.print_logo(Assets.getlogo)
  puts ''
  puts Assets.line(@width, '-')
  puts ''
  puts_board(@board, color, on_color) unless arr.nil?
end

def puts_board(boa, color, on_color)
  board = @ui.print_board(boa, color, on_color)
  puts board.empty_line
  3.times do |x|
    board.rows[x].length.times do |y|
      print board.rows[x][y]
    end
    puts ''
    puts board.empty_line
  end
end

prints = lambda do
  puts 'Give a valid number'.red
  return gets.chomp
end

def movements(player, board, counter, sign, on_invalid)
  puts "#{player} select your move"
  move = gets.chomp
  move = Player.ask_move(move, board, on_invalid)
  p move
  board[move.to_i - 1] = sign
  counter + 1
end

Assets.clear
render

2.times do |x|
  puts Player.question(x)
  player = gets.chomp
  until player.length.positive?
    puts 'Enter a valid name:'.red
    player = gets.chomp
  end
  @players << player
end

game_on = true
while game_on
  Assets.clear
  render(@board, :green, :on_blue)
  puts ''
  @x = if (@x % 2).zero?
         movements(@players[0], @board, @x, 'X', prints)
       else
         movements(@players[1], @board, @x, 'O', prints)
       end
  game_on = false if Logic.winner(@board)
end

Assets.clear
render(@board, :green, :on_blue)

puts Logic.winner(@board) ? "#{@players[(@x - 1) % 2]} is the winner!".blue : 'Is a draw!'.yellow
