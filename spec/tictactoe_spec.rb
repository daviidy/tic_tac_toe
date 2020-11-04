require 'simplecov'
SimpleCov.start

require '../bin/main.rb'
require '../lib/player.rb'
require '../lib/board.rb'
require '../lib/evaluatable.rb'

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
  end

  describe Evaluatable do
    let(:board) { Board.new }
    let(:player) { Player.new('dave') }
    # let(:main) { Main.new }

    describe '#evaluate' do
      include Evaluatable
      include Movable
      it 'Should return -10 if player X wins' do
        board.add_piece(board.converter, 1)
        board.add_piece(board.converter, 2)
        board.add_piece(board.converter, 4)
        expect(evaluate(board.board)).to eql(-10)
      end
      board = Board.new
      it 'Should return 10 if player O wins' do
        board.add_piece(board.converter, 5)
        board.add_piece(board.converter, 1)
        board.add_piece(board.converter, 9)
        expect(evaluate(board.board)).to eql(10)
      end
      board = Board.new
      it 'Should return false if there is no other move left(Game ended in draw)' do
        board.add_piece(board.converter, 1)
        board.add_piece(board.converter, 8)
        board.add_piece(board.converter, 3)
        board.add_piece(board.converter, 6)
        expect(move?(board.board)).to eql(false)
      end
    end
  end
end
