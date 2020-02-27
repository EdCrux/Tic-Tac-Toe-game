require_relative './views.rb'
require 'tty-screen'
require 'rubygems'

class Welcome
  def self.print_message(print)
    width = TTY::Screen.width
    @message = Message.message
    Message.newline(2, &print)
    @message[:logo].each do |x|
      col = rand(2..String.colors.length - 2)
      yield(x.send(String.colors[col].to_sym))
    end

    Message.newline(2, &print)
    yield(@message[:welcome].center(width))
    Message.newline(1, &print)
    yield(@message[:div_line].blue.center(width))
    Message.newline(1, &print)
  end

  def self.clear
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
  end
end
