# rubocop:disable all
module Evaluatable
  # This function take 3 args and check

  # - if they are equal, return true

  # - if thery are not equal, return false

  def are_equal?(the_a, the_b, the_c, player, opponent)
    the_a == the_b && the_b == the_c && the_c == the_b && (the_a == player || the_a == opponent)
  end

  def player?(board_cell, player, opponent)
    return 10 if board_cell == player

    return -10 if board_cell == opponent
  end

  # This function take a board a evaluate it

  # - if player wom, return 10

  # - if opponent wom, return -10

  # - if there is no winer, return 0

  def evaluate(board, player = 'o', opponent = 'x')
    # Checking rows for victory
    3.times do |row|
      if are_equal?(board[row][0], board[row][1], board[row][2], player, opponent)
        return player?(board[row][0], player, opponent)
      end
    end
    # Checking cols for victory
    3.times do |col|
      if are_equal?(board[0][col], board[1][col], board[2][col], player, opponent)
        return player?(board[0][col], player, opponent)
      end
    end
    # Checking frist diagonal for victory
    return player?(board[0][0], player, opponent) if are_equal?(board[0][0], board[1][1], board[2][2], player, opponent)
    # Checking second diagonal for victory
    return player?(board[0][2], player, opponent) if are_equal?(board[0][2], board[1][1], board[2][0], player, opponent)
    # If none of them have won
    0
  end
end
