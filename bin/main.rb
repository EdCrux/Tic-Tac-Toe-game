#!/usr/bin/env ruby

require_relative '../lib/welcome.rb'
require_relative '../lib/names.rb'
require 'colorize'
require 'readline'
require_relative '../lib/board.rb'
require_relative '../lib/views.rb'
require_relative '../lib/input.rb'

print = proc { |x| puts x }
get_value = lambda { return gets.chomp }

Welcome.clear
Welcome.print_message(print, &print)

a = Names.new
a.ask_player(get_value, &print)

input = Input.new
input.ask_for_move(a.players, get_value, print)
