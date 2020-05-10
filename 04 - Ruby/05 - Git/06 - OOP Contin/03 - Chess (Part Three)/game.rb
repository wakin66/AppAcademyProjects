require_relative 'board.rb'
require_relative 'players.rb'
require_relative 'display.rb'

class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {
            :white => HumanPlayer.new,
            :black => HumanPlayer.new
        }
        @current_player = :black
    end

    def play

    end

    private

    def notify_players

    end

    def swap_turn!
        @current_player = @current_player == :white ? :black : :white
    end

end