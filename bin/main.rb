#!/usr/bin/env ruby
# rubocop:disable all
# our game will have 3 classes
# the game itself
# the players
# the board
class TicTacToe
    # initialize
      # set up the board
      # set up the players
      # assign the starting player
    # play
    def play
      # loop infinitely
          # call the board rendering method
          # ask for coordinates from the current player
          puts "Please enter your coordinates below"
          input = gets.chomp
          puts "Now, your move is displayed on the board, precisely at #{input}"
          # break the loop IF the game is over
          # switch players
    end

    # check_game_over
        # check_victory
        # check_draw

    # check_victory
        # IF board says current player's piece has
        # a winning_combination?
            # display a victory message

    # check_draw
        # IF Board says we've filled up
            # display a draw message


    # switch_players
        # PlayerX >> PlayerO or vice versa
end

new_game = TicTacToe.new
new_game.play
