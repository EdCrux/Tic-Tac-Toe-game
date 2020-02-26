#!/usr/bin/env ruby

require_relative "../lib/welcome.rb"
require_relative "../lib/names.rb"
require 'colorize'
require 'readline'
require_relative "../lib/board.rb"
require_relative "../lib/views.rb"

Welcome.printMessage
a = Names.new
a.ask_player(2)
Message.newline
Board.render (["O","X","O","X","O","O","X","X","O"])