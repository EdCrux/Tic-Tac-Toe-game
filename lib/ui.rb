require_relative 'assets'
require_relative 'board'
require 'colorize'
require 'tty-screen'

@board = %w[1 2 3 4 5 6 7 8 9]

class Ui
  include Assets

  def print_logo(logo)
    obj = []
    logo.each do |line|
      color = rand(2..String.colors.length - 2)
      obj << line.send(String.colors[color].to_sym)
    end
    obj
  end

  def print_board(arr, color, on_color)
    board = Board.new
    board.empty_line = Assets.line(13, '-').send(color)
    temp_print = []
    [0, 3, 6].each do |x|
      temp_print = []
      3.times do |y|
        temp_print << '|'.send(color)
        temp_print << if arr[y + x].between?('1', '9')
                        " #{arr[y + x]} ".send(on_color)
                      else
                        " #{arr[y + x]} ".send(Assets.color(arr[y + x]))
                      end
      end
      temp_print << '|'.send(color)
      board.rows << temp_print
    end
    board
  end
end
