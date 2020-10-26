# frozen_string_literal: true

module Evaluatable
  # This function take 3 args and check
  # - if they are equal, return true
  # - if thery are not equal, return false
  def are_equal?(a, b, c, player, opponent) # TTD:✔
    a == b && b == c && c == b && (a == player || a == opponent)
  end

  def is_player?(board_Cell, player, opponent) # TTD:✔
    return 10 if board_Cell == player
    return -10 if board_Cell == opponent
  end

  # This function take a board a evaluate it
  # - if player wom, return 10
  # - if opponent wom, return -10
  # - if there is no winer, return 0
  def evaluate(board, player = 'o', opponent = 'x') # TTD:✔
    # Checking rows for victory
    3.times do |row|
      if are_equal?(board[row][0], board[row][1], board[row][2], player, opponent)
        return is_player?(board[row][0], player, opponent)
      end
    end
    # Checking cols for victory
    3.times do |col|
      if are_equal?(board[0][col], board[1][col], board[2][col], player, opponent)
        return is_player?(board[0][col], player, opponent)
      end
    end
    # Checking frist diagonal for victory
    if are_equal?(board[0][0], board[1][1], board[2][2], player, opponent)
      return is_player?(board[0][0], player, opponent)
    end
    # Checking second diagonal for victory
    if are_equal?(board[0][2], board[1][1], board[2][0], player, opponent)
      return is_player?(board[0][2], player, opponent)
    end

    # If none of them have won
    0
  end
end
