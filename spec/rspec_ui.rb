require_relative '../lib/ui.rb'
require 'colorize'

describe Ui do
  let(:ui) { Ui.new }
  let(:colorize_arr) { %w[color color1 color2 color3] }
  let(:board_arr) { %w[X X O O O X X O X] }

  describe '#print_logo' do
    it 'throw error with no arguments' do
      expect(-> { ui.print_logo }).to raise_error(ArgumentError)
    end
    context 'Mock test to see the correct color' do
      before do
        allow(ui).to receive(:rand).and_return(4)
      end
      it 'return the correct color' do
        expect(ui.print_logo(colorize_arr)[0]).to match('\\;(\\d..)')
      end
    end
  end

  describe '#print_board' do
    context 'Argument passing' do
      it 'return a object of type Board' do
        expect(ui.print_board(board_arr, :red, :on_green)).to be_instance_of(Board)
      end

      it 'return not nil object' do
        expect(ui.print_board(board_arr, :red, :on_green)).not_to be nil
      end
    end
  end
end
