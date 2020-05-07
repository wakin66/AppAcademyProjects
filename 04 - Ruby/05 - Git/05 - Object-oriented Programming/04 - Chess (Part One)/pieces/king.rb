require_relative 'piece'
require_relative 'stepable'
require 'colorize'

class King < Piece
    include Stepable

    def initialize(color,board,pos)
        super
    end

    def move_diffs
        diffs = [[-1,0],[1,0],[0,-1],[0,1],[-1,-1],[-1,1],[1,-1],[1,1]]
    end

end