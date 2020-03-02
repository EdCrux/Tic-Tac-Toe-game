#!/usr/bin/env ruby

require 'colorize'
require 'tty-screen'
require 'rubygems'

@width = TTY::Screen.width
@players = []

def get_logo
    logo = []
    logo << ' _____ _        _____            _____  '
    logo << '|_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___'
    logo << '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\'
    logo << '  | | | | (__    | | (_| | (__    | | (_) |  __/'
    logo << '  |_| |_|\\___|   |_|\\__,_|\\___|   |_|\\___/ \\___|'
    logo
end

def render(logo)
    print_logo(logo)
    puts ""
    puts line(@width, "-")
    puts ""
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



