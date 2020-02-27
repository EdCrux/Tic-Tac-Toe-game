class Names
  def initialize
    @arr_players = []
  end

  def ask_player(bl, number = 2)
    number.times do |x|
      yield(question(x + 1))
      value = bl.call
      until value.length.positive?
        yield 'Give a valid name: '.red
        value = bl.call
      end
      @arr_players << value.capitalize
    end
  end

  def question(number)
    "Please enter the name of the #{number == 1 ? 'first' : 'second'} player"
  end

  def players
    @arr_players
  end
end
