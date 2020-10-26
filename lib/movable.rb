# frozen_string_literal: true

module Movable
  # This function take a board and check
  # - if there are moves remaining on the board, return true
  # - if there are no moves left to play, returns false
  def has_move?(board) # TTD:✔
    3.times do |row|
      3.times do |col|
        return true if board[row][col] == '_'
      end
    end
    false
  end
end
