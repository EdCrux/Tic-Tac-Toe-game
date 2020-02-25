class Names 
    attr_reader :arr_players

    def initialize
        @arr_players = []
    end

    def ask_player(number)
        number.times do |x| 
            puts question(x+1)
            @arr_players << gets.chomp
        end
    end

    def question(number)
        "Please enter the name of the #{ number == 1 ? "first" : "second" } player"
    end
end