#!/usr/bin/env ruby

require_relative "../lib/welcome.rb"
require_relative "../lib/names.rb"
require 'colorize'
require 'readline'

Welcome.printMessage


 a = Names.new

a.ask_player(3)