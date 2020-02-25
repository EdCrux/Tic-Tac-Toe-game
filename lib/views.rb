module Message
    @mes = Hash.new

    def self.message
        @mes[:title] = self.title
        @mes[:welcome] = self.welcome
        @mes[:logo] = self.logo
        return @mes
    end

    def self.newline(lineNr = 1)
        lineNr.times { puts "" }
    end

    private
    def self.title
        "Tic Tac Toc Game"
    end

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
end
