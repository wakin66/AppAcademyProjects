require_relative 'args'
require_relative 'board'
require 'yaml'

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
            action = get_action
            if action == "s"
                save_game
            elsif action == "q"
                exit 0
            else
                pos = get_pos
                tile = board[pos]
                if action == "r"
                    tile.reveal
                    tile.reveal_empty if tile.neighbor_bomb_count == 0
                    puts
                    board.game_over if tile.bombed?
                elsif action == "f"
                    tile.flag
                end
            end
        end
    end

    def get_pos
        pos = nil
        until pos && valid_pos?(pos)
            puts "Please enter a position on the board (e.g., '3,4')"
            print "> "

            begin
                pos = parse_pos(gets.chomp)
                raise if !valid_pos?(pos)
            rescue
                puts "Invalid position entered (did you use a comma?)"
                puts

                pos = nil
            end
        end
        return pos
    end

    def get_action
        action = nil
        until action && valid_action?(action)
            puts "Please enter the action to take ('r'eveal, 'f'lag, 's'ave, 'q'uit)"
            print "> "

            begin
                action = gets.chomp
                raise if !valid_action?(action)
            rescue
                puts "Invalid action entered"
                puts

                action = nil
            end
        end
        return action
    end

    def valid_action?(string)
        string.is_a?(String) &&
            string.length == 1 &&
            "frsq".include?(string)
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

    def save_game
        File.open("board.yml", "w") { |file| file.write(@board.to_yaml) }
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