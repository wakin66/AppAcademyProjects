require_relative 'piece'
require 'colorize'

class Pawn < Piece

    def initialize(color,board,pos)
        super
    end

    def symbol
        '♟'.colorize(color)
    end

    def moves
        forward_steps + side_attacks
    end

    private

    def at_start_row?
        return true if color == :black && pos.first == 1
        return true if color == :white && pos.first == 6
        return false
    end

    def forward_dir
        color == :black ? 1 : -1
    end

    def forward_steps
        x,y = pos
        one_step = [x+forward_dir,y]
        two_step = [x+(forward_dir*2),y]
        list = Array.new
        list << one_step if board.valid_pos?(one_step) && board[one_step].symbol == :null
        list << two_step if at_start_row? && board.valid_pos?(two_step) && board[two_step].symbol == :null
        return list
    end

    def side_attacks
        list = Array.new
        return list
    end

end