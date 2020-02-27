class Names
  def initialize
    @arr_players = []
  end

  def ask_player(bli, number = 2)
    number.times do |x|
      yield(question(x + 1))
      value = bli.call
      until value.length.positive?
        yield 'Give a valid name: '.red
        value = bli.call
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
