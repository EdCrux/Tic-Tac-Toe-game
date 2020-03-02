module Logic 

def self.draw(board)
    return true if @x == 8
end
  
def self.winner(arr)
    2.times do |i|
     return true if arr[i * 3] === arr[(i*3)+1] && arr[i * 3] === arr[(i*3)+2]
     return true if arr[i] === arr[i+3] && arr[i] === arr[i+6]
    end
     return true if arr[0] === arr[4] && arr[0] === arr[8] || arr[2] === arr[4] && arr[2] === arr[6]
    false
end

end