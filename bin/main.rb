#!/usr/bin/env ruby

require_relative "../lib/views.rb"
require 'colorize'
require 'readline'

Message.newline(2)

a = Message.message 

a[:logo].each do |x|
    col = rand(2..String.colors.length-2)
    puts x.send(String.colors[col].to_sym)
end

Message.newline(2)
puts a[:welcome]
puts a[:div_line].blue

puts "Player 1 : " 
