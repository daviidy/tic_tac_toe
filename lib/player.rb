require './lib/evaluatable.rb'
require './lib/movable.rb'

# Ruby program to find the
# next optimal move for a player
class Player
  def initialize(player = 'o', opponent = 'x')
    @player = player
    @opponent = opponent
  end

  # This will return the best possible
  # move for the player
  def find_best_move(board)
    best_value = -1.0 / 0.0
    move = { row: -1, col: -1 }

    # Looping on all empty board cells
    # and return the cell with optimal value

    3.times do |row|
      3.times do |col|
        # Checking if the cell is empty
        next unless board[row][col] == '_'

        # Make the move
        board[row][col] = player
        move_value = minimax(board, false)
        # Undo the move
        board[row][col] = '_'

        # If the value of current move is more than
        # the best move, then update best_move
        next unless move_value > best_value

        best_value = move_value
        move[:row] = row
        move[:col] = col
      end
    end
    # return the best move
    move
  end

  private

  include Movable
  include Evaluatable
  attr_accessor :player, :opponent

  # This method return max between 2 numbers
  def max(a, b)
    a > b ? a : b
  end

  # This method return min between 2 numbers
  def min(a, b)
    a < b ? a : b
  end

  # This function considers all the possible ways the game can go
  # and returns the value of the best board
  def minimax(board, is_player)
    score = evaluate(board, player, opponent)

    # If player has won the game
    # return his evaluated score
    return score if score == 10

    # If opponent has won the game
    # return his evaluated score
    return score if score == -10

    # If there are no more moves and no winner
    # then it is a tie, else continue
    return 0 unless move?(board)

    # if this is player turn to move
    if is_player
      best = -1.0 / 0.0

      # looping on all board cells
      3.times do |row|
        3.times do |col|
          # Checking if the cell is empty
          next unless board[row][col] == '_'

          # Make the move
          board[row][col] = player

          # Call minimax recursively and choose
          # the maximum value
          best = max(best, minimax(board, !is_player))

          # Undo the move
          board[row][col] = '_'
        end
      end

    # if this is opponent turn to move
    else
      best = 1.0 / 0.0

      # looping on all board cells
      3.times do |row|
        3.times do |col|
          # Checking if the cell is empty
          next unless board[row][col] == '_'

          # Make the move
          board[row][col] = opponent

          # Call minimax recursively and choose
          # the maximum value
          best = min(best, minimax(board, !is_player))

          # Undo the move
          board[row][col] = '_'
        end
      end
    end
    best
  end
end
