require_relative '../lib/ui.rb'
require 'colorize'

describe Ui do
   let(:ui){Ui.new}
   let(:colorize_arr) {%w[color color1 color2 color3]}
    describe "#print_logo" do
        it "throw error with no arguments" do
          expect(lambda{ui.print_logo}).to raise_error(ArgumentError)
        end
        context "Mockk test to see the correct color" do
            before do
                allow(ui).to receive(:rand).and_return(4)
            end
            it "return the correct color" do
                expect(ui.print_logo(colorize_arr)[0]).to match("\\;(\\d..)")
            end
        end
    end
    
    describe "#print_board" do

    end
end