# rubocop:disable all
require './lib/board.rb'
require './lib/movable.rb'

require './lib/evaluatable.rb'
require './lib/player.rb'

class Main
  include Movable

  include Evaluatable

  def initialize
    @board = Board.new
    @game = @board.board
    @player = Player.new
    @converter = @board.converter
  end

  attr_accessor :game

  attr_accessor :board

  attr_reader :player, :converter

  def play

    puts "#{@player.name} what's your name?"

    @player.name = gets.chomp

    puts "#{@player.name} your piece is(#{@player.player})!"

    result = ''

    puts "\n\nTIC TAC TOE"

    puts board.display

    done = false

    until done



      puts "\n#{@player.name}, please insert Position"

      number = gets.chomp.to_i

      while number < 1 || number > 9
        puts 'Invalid entry please try between 1-9'
        number = gets.chomp.to_i
      end

      if board.is_occupied(converter, number) == false
        puts 'This Position is Occupied Choice another one'
        number = gets.chomp.to_i
      else
        board.add_piece(converter, number)
      end

      puts board.display

      evaluated = evaluate(game)

      move = move?(game)

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
main = Main.new
main.play
