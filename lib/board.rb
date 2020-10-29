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

      if board[converter[number][0]][converter[number][1]] == 'o' ||
         board[converter[number][0]][converter[number][1]] == 'x'

        puts 'This Position is Occupied Choice another one'
        number = gets.chomp.to_i
      end

      board[converter[number][0]][converter[number][1]] = 'x'

      player_move = player.find_best_move(board)

      board[player_move[:row]][player_move[:col]] = 'o'

      display

      evaluated = evaluate(board)

      move = move?(board)

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
