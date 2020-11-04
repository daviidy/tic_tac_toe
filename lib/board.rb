# rubocop:disable all
require './lib/movable.rb'

require './lib/evaluatable.rb'
require './lib/player.rb'

class Board
  include Movable

  include Evaluatable

  def initialize
    @player = Player.new
    @board = [

      %w[_ _ _],

      %w[_ _ _],

      %w[_ _ _]

    ]

    @converter = {

      1 => [2, 0],

      2 => [2, 1],

      3 => [2, 2],

      4 => [1, 0],

      5 => [1, 1],

      6 => [1, 2],

      7 => [0, 0],

      8 => [0, 1],

      9 => [0, 2]

    }
  end

  attr_accessor :board

  attr_reader :player, :converter

  def display
    string_1 = " #{board[0][0]} | #{board[0][1]} | #{board[0][2]}"

    string_2 = '-----------'

    string_3 = " #{board[1][0]} | #{board[1][1]} | #{board[1][2]}"

    string_4 = '-----------'

    string_5 = " #{board[2][0]} | #{board[2][1]} | #{board[2][2]}"

    playground = "#{string_1}\n#{string_2}\n#{string_3}\n#{string_4}\n#{string_5}"
  end

  def is_occupied(converter, number)
    if board[converter[number][0]][converter[number][1]] == 'o' ||
       board[converter[number][0]][converter[number][1]] == 'x'
      return false
    end
    true
  end

  def add_piece(converter, number)
    board[converter[number][0]][converter[number][1]] = 'o'

    player_move = player.find_best_move(board)

    board[player_move[:row]][player_move[:col]] = 'x'
  end

end
