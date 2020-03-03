module Assets
  def self.getlogo
    logo = []
    logo << ' _____ _        _____            _____  '
    logo << '|_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___'
    logo << '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\'
    logo << '  | | | | (__    | | (_| | (__    | | (_) |  __/'
    logo << '  |_| |_|\\___|   |_|\\__,_|\\___|   |_|\\___/ \\___|'
    logo
  end

  def self.clear
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
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

  def self.line(width, sign)
    line = ''
    width.times do
      line << sign
    end
    line
  end
end
