require 'tty-screen'
module Message
  @mes = {}
  @width = TTY::Screen.width
  def self.message
    @mes[:welcome] = welcome
    @mes[:logo] = logo
    @mes[:div_line] = div_line('-', @width)
    @mes
  end

  def self.newline(line_nr = 1)
    line_nr.times { puts '' }
  end

  def self.welcome
    'Dear users, welcome!'
  end

  def self.logo
    logo = []
    logo << ' _____ _        _____            _____  '
    logo << '|_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___'
    logo << '  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\'
    logo << '  | | | | (__    | | (_| | (__    | | (_) |  __/'
    logo << '  |_| |_|\\___|   |_|\\__,_|\\___|   |_|\\___/ \\___|'
    logo
  end

  def self.div_line(*type)
    temp_string = ''
    type[1].times { temp_string << type[0] } if type.length == 2
    temp_string
  end
end
