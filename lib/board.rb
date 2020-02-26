module Board
    def self.render(m)
        width = TTY::Screen.width
        count = 0
        
        3.times do |x|
            a = " #{m[0+count].send(color(m[0+count])) } | #{m[1+count].send(color(m[1+count]))} | #{m[2+count].send(color(m[2+count]))}"
            puts a.center(width+40)
            puts "-----------".center(width) if count < 6
            count += 3
        end
     end
     def self.color(mov)
        mov == 'X' ? :blue : :green
     end
end