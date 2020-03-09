require_relative '../lib/logic.rb'

describe Logic do
    let(:win){%w[X X X O O X O O X]}
    let(:lose){%w[X X O O O X X O X]}
 

    describe '#winner' do

        it "throw error with no arguments" do
            expect(lambda{Logic.winner}).to raise_error(ArgumentError)
        end

        it "return true" do
            expect(Logic.winner(win)).to be true
        end

        it "return false" do
            expect(Logic.winner(lose)).to be false
        end

        context "Mock test" do
            before do
                allow(Logic).to receive(:tl_rb).with(lose).and_return(true)
            end
        it "return true if cross is true" do
            expect(Logic.winner(lose)).to be true
        end
    end
    end

    describe '#rows' do
        it "return true" do
            expect(Logic.rows(win,0)).to be true
        end

        it "return false" do
            expect(Logic.rows(lose,0)).to be false
        end
    end

    describe '#columns' do
        it "return false" do
            expect(Logic.columns(win,0)).not_to be true
        end

        it "return false" do
            expect(Logic.columns(lose,0)).to be false
        end
    end
    
    describe '#tl_rb' do
        it "return false" do
            expect(Logic.tl_rb(win)).to be false
        end

        it "return false" do
            expect(Logic.tl_rb(lose)).to be false
        end
    end

    describe '#tl_lb' do
        it "return false" do
            expect(Logic.tr_lb(win)).to be false
        end

        it "returns false" do
            expect(Logic.tr_lb(lose)).to be false
        end
    end
end