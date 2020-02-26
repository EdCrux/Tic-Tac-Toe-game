require_relative './views.rb'
require 'tty-screen'
require 'rubygems'

class Welcome
  def self.print_message
    width = TTY::Screen.width
    @message = Message.message
    Message.newline(2)
    @message[:logo].each do |x|
      col = rand(2..String.colors.length - 2)
      puts x.send(String.colors[col].to_sym)
    end

    Message.newline(2)
    puts @message[:welcome].center(width)
    Message.newline(1)
    puts @message[:div_line].blue.center(width)
    Message.newline(1)
  end

  def self.clear
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
  end
end
