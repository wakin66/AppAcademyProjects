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
        until game_over?
            board.render
            pos = get_pos
            tile = board[pos]
            tile.reveal
            puts
            board.game_over if tile.bombed?
        end
    end

    def get_pos
        pos = nil
        until pos && valid_pos?(pos)
            puts "Please enter a position on the board (e.g., '3,4')"
            print "> "

            begin
                pos = parse_pos(gets.chomp)
            rescue
                puts "Invalid position entered (did you use a comma?)"
                puts ""

                pos = nil
            end
        end
        pos
    end

    def parse_pos(string)
        string.split(",").map { |char| Integer(char) }
    end

    def valid_pos?(pos)
        pos.is_a?(Array) &&
            pos.length == 2 &&
            pos.all? { |x| x.between?(0, board.size - 1) }
    end

    private

    attr_reader :board

    def game_over?
        board.won? || board.lost?
    end

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