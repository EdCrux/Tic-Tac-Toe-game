class Names 

    def initialize
        @arr_players = []
    end

    def ask_player(number = 2)
        number.times do |x| 
            puts question(x+1)
            value = gets.chomp
            until value.length > 0
                print "Give a valid name: ".red
                value = gets.chomp
            end 
            @arr_players << value.capitalize
        end
    end

    def question(number)
        "Please enter the name of the #{ number == 1 ? "first" : "second" } player"
    end

    def players
        @arr_players
    end

end