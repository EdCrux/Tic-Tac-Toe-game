#!/usr/bin/env ruby

require_relative '../lib/welcome.rb'
require_relative '../lib/names.rb'
require 'colorize'
require 'readline'
require_relative '../lib/board.rb'
require_relative '../lib/views.rb'
require_relative '../lib/input.rb'

Welcome.clear
Welcome.print_message
a = Names.new
a.ask_player
Message.newline
input = Input.new
input.ask_for_move(a.players)
