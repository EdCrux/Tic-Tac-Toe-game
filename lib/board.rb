module Board
  def self.render(move)
    width = TTY::Screen.width
    count = 0

    3.times do
      a = " #{move[0 + count].send(color(move[0 + count]))} | #{move[1 + count].send(color(move[1 + count]))} "
      a << "| #{move[2 + count].send(color(move[2 + count]))}"
      yield a.center(width + 40)
      yield '-----------'.center(width) if count < 6
      count += 3
    end
  end

  def self.color(mov)
    case mov
    when 'X'
      :blue
    when 'O'
      :green
    else
      :white
    end
  end
end
