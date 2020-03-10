require_relative '../lib/player.rb'

describe Player do
   let(:player1){0}
   let(:player2){1}
   let(:wrong_player){3}
   let(:movement){1}
   let(:move_arr_full){%w[X X O O O X X O X]}
   let(:move_arr){%w[1 X O O O X X O X]}
   let(:board){%w[1 2 3 4 5 6 7 8 9]}
   let(:prints){
       lambda do
        puts 'Given a valid number'
       end
   }
    describe "#question" do 
     it "returns the question for the first player" do
       expect(Player.question(player1)).to eql(
           "Please enter the name of the first player"
       )
     end

     it "returns the question for the second player" do 
        expect(Player.question(player2)).to eql(
            "Please enter the name of the second player"
        )
      end
     
     it "returns and error if no arguments" do 
        expect(lambda{Player.question}).to raise_error(ArgumentError)
     end
    end

    describe "#validate" do
     it "returns false when there is not moves" do
        expect(Player.validate( movement,move_arr_full)).not_to be true
     end
     it "returns true when there is available move" do
        expect(Player.validate(movement,move_arr)).to be true
     end

    describe "#ask_move" do
     it "return the move if it is in range" do
        expect(Player.ask_move(movement, board, prints)).to eql(movement)
     end
    end
end