require_relative 'args'
require_relative 'board'

class Game

    def initialize(file = nil,size = nil)
        #Usage: #$0 ruby minesweeper.rb [-f arg] [-s arg]
        if !size.nil?
            @board = Board.new(size)
        else
            @board = Board.new
        end
    end

    def play
        board.render
        pos = [2,2]
        board[pos].reveal
        puts
        board.render
    end

    private

    attr_reader :board

end

if __FILE__ == $PROGRAM_NAME
    flags = {           #Cli flags and whether or not they accept another argument
        "-f" => true,   #This denotes a save file to be loaded.
        "-s" => true    #Denotes size of board.
    }
    args = Args.new(ARGV,flags)
    game = Game.new(args["-f"],args["-s"])
    game.play
end