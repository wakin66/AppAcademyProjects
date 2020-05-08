require 'colorize'

class Displey
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render

    end

end