#!/usr/bin/env ruby

require_relative "../lib/welcome.rb"
require_relative "../lib/names.rb"
require 'colorize'
require 'readline'
require_relative "../lib/board.rb"
require_relative "../lib/views.rb"
require_relative "../lib/input.rb"

Welcome.printMessage
a = Names.new
a.ask_player(2)
Message.newline

arr = ["1","2","3","4","5","6","7","8","9"]

puts "Select the number in where to move".blue
Board.render(arr)
input = Input.new

input.ask_for_move(a.players,arr)