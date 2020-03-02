#!/usr/bin/env ruby

require 'colorize'
require 'tty-screen'
require 'rubygems'
require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/assets'
require_relative '../lib/Ui'
require_relative '../lib/Logic'

@width = TTY::Screen.width
@players = []
@board = %w[1 2 3 4 5 6 7 8 9]
@x = 0

@ui = Ui.new

def render(logo, arr = nil, color = :blue, on_color = :on_red)
  puts logo
  puts ''
  puts Assets.line(@width, '-')
  puts ''
  puts_board(@board,color, on_color)
end

def puts_board(boa,color, on_color)
  board = @ui.print_board(boa, color, on_color)
  puts board.emptyLine
3.times do |x|
    board.rows[x].length.times do |y|
        print board.rows[x][y]
    end
    puts ""
    puts board.emptyLine
end
end

def draw(_board)
  return true if @x == 8
end

def winner
  false
end

render(Assets.getlogo)

2.times do |x|
  puts Player.question(x)
  player = gets.chomp
  until player.length.positive?
    puts 'Enter a valid name:'.red
    player = gets.chomp
  end
  @players << player
end

prints = lambda do |m|
   puts "Give a valid number" 
   return gets.chomp 
end

game_on = true
while game_on
 Assets.clear
  render(Assets.getlogo, @board, :green, :on_blue)
  if (@x % 2).zero?
    puts "#{@players[0]} select your move"
    move = gets.chomp
    move = Player.ask_move(@players[0],move,@board,prints)
    @board[move.to_i - 1] = 'X'
    @x += 1
  else
    puts "#{@players[1]} select your move"
    move = gets.chomp
    move = Player.ask_move(@players[1],move,@board,prints)
    @board[move.to_i - 1] = 'O'
    @x += 1
  end
  game_on = false if Logic.winner(@board) || Logic.draw(@board)
end

Assets.clear
render(Assets.getlogo, @board, :green, :on_blue)
puts 'It is a draw!'
