require './lib/movable.rb'

require './lib/evaluatable.rb'

class Board
  include Movable

  include Evaluatable

  def initialize
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
    puts " #{board[0][0]} | #{board[0][1]} | #{board[0][2]}"

    puts '-----------'

    puts " #{board[1][0]} | #{board[1][1]} | #{board[1][2]}"

    puts '-----------'

    puts " #{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
  end

  def play
    result = ''

    puts "\n\nTIC TAC TIE"

    display

    done = false

    until done

      puts "\nInsert Position"

      number = gets.chomp.to_i

      board[converter[number][0]][converter[number][1]] = 'x'

      player_move = { row: rand(2), col: rand(2) }

      board[player_move[:row]][player_move[:col]] = 'o'

      display

      evaluated = evaluate(board)

      move = has_move?(board)

      if evaluated == 10

        done = true

        result = 'O win'

      end

      if evaluated == -10

        done = true

        result = 'X win'

      end

      next unless evaluated.zero? && !move

      done = true

      result = 'draw'

    end

    puts result
  end
end
