require_relative '../board'

class Piece

    def initialize(symbol,board,pos)
        @symbol = symbol
        @board = board
        @pos = pos
    end
end