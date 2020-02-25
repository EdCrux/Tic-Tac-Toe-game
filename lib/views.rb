require 'tty-screen'
module Message
    @mes = Hash.new
    @width = TTY::Screen.width
    def self.message
        @mes[:welcome] = self.welcome
        @mes[:logo] = self.logo
        @mes[:div_line] = self.div_line("-",@width)
        return @mes
    end

    def self.newline(lineNr = 1)
        lineNr.times { puts "" }
    end

    private
    def self.welcome
        "Dear users, welcome!"
    end

    def self.logo
        logo = []
        logo << " _____ _        _____            _____  "
        logo << "|_   _(_) ___  |_   _|_ _  ___  |_   _|__   ___"
        logo << "  | | | |/ __|   | |/ _` |/ __|   | |/ _ \\ / _ \\"
        logo << "  | | | | (__    | | (_| | (__    | | (_) |  __/"
        logo << "  |_| |_|\\___|   |_|\\__,_|\\___|   |_|\\___/ \\___|"
        logo
    end

    def self.div_line (*type)
        tempString = ""
        if type.length == 2
           type[1].times { tempString << type[0] }
        end
        tempString
    end
end


