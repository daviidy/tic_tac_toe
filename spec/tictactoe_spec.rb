require 'simplecov'
SimpleCov.start

require '../bin/main.rb'
require '../lib/player.rb'
require '../lib/board.rb'

describe 'Tic Tac Toe' do
  describe Board do
    let(:player) { Player.new('dave', 'o', 'x') }
    let(:board) { Board.new }
    let(:row) { %w[_ _ _] }
    describe '#initialize' do
      it 'board.player is an instance of Player class' do
        expect(board.player.is_a?(Player)).to eql(true)
      end
      it 'board.board is an array containing 3 rows' do
        expect(board.board.all?(row)).to eql(true)
      end
      it 'board.converter positions are not nil and are arrays' do
        expect(board.converter.any?(nil)).to eql(false)
        expect(board.converter.all?(Array)).to eql(true)
      end
    end

    describe '#display' do
      it 'return the playgroung as string' do
        expect(board.display.is_a?(String)).to eql(true)
      end
    end

    describe '#is_occupied' do
      it 'return true as valid or invalid position' do
        expect(board.is_occupied(board.converter, 2)).to eql(true)
        board.add_piece(board.converter, 2)
        expect(board.is_occupied(board.converter, 2)).to eql(false)
      end
    end
    # describe '#is_occupied' do
    #   it 'returns true when position is valid' do
    #     expect(board.is_occupied(board.converter, 5)).to eql(true)
    #   end
    # end
  end
end
