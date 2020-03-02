#!/usr/bin/env ruby

require 'colorize'
require 'tty-screen'
require 'rubygems'

@width = TTY::Screen.width
@players = []
@board = %w[1 X 3 4 5 6 7 8 9]

def get_logo
    logo = []
    logo << ' _____ _        _____            _____  '
    logo << '|_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___'
    logo << '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\'
    logo << '  | | | | (__    | | (_| | (__    | | (_) |  __/'
    logo << '  |_| |_|\\___|   |_|\\__,_|\\___|   |_|\\___/ \\___|'
    logo
end

def render(logo, arr = nil , color = :blue, on_color = :on_red)
    print_logo(logo)
    puts ""
    puts line(@width, "-")
    puts ""
    print_board(arr, color, on_color) if arr != nil
end

def print_board(arr, color, on_color)
    puts line(13,"-").send(color)
    [0,3,6].each do |x|
        3.times do |y|
            print "|".send(color)
            print arr[y+x].between?("1","9") ? " #{arr[y+x]} ".send(on_color) : " #{arr[y+x]} "
        end
    print "|".send(color)
    puts ""
    puts line(13,"-").send(color)
    end
end

def print_logo(logo)
    logo.each do |line|
        color = rand(2..String.colors.length - 2)
        puts line.send(String.colors[color].to_sym)
    end
end

def line(width, sign)
    line = ""
    width.times do
        line << sign
    end
    line
end

render(get_logo)

2.times do |x|
  puts "Please enter the name of the #{x == 0 ? 'first' : 'second'}  player"
  player = gets.chomp
  until player.length.positive?
    puts "Enter a valid name:".red
    player = gets.chomp
  end
  @players << player
end


render(get_logo, @board, :green, :on_blue)