# rubocop:disable all
module Movable
  # This function take a board and check

  # - if there are moves remaining on the board, return true

  # - if there are no moves left to play, returns false

  def move?(board)
    3.times do |row|
      3.times do |col|
        return true if board[row][col] == '_' 
      end
    end

    false
  end
end
