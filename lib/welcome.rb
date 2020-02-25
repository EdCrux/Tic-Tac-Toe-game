require_relative './views.rb'

class Welcome
    def self.printMessage
        @message = Message.message
        Message.newline(2)
        @message[:logo].each do |x|
            col = rand(2..String.colors.length-2)
            puts x.send(String.colors[col].to_sym)
        end
        
        Message.newline(2)
        puts @message[:welcome]
        puts @message[:div_line].blue
        Message.newline(3)
    end
end