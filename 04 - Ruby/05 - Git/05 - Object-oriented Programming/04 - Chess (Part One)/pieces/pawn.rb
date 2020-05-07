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
        steps = Array.new
        steps << one_step if board.valid_pos?(one_step) && board[one_step].symbol == :null
        steps << two_step if at_start_row? && board.valid_pos?(two_step) && board[two_step].symbol == :null
        return steps
    end

    def side_attacks
        x,y = pos
        steps = Array.new
        left_step = [x+forward_dir,y-1]
        right_step = [x+forward_dir,y+1]
        steps << left_step if board.valid_pos?(left_step) && board[left_step].symbol != :null
        steps << right_step if board.valid_pos?(right_step) && board[right_step].symbol != :null
        return steps
    end

end