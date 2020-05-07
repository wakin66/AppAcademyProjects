class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?
        return false
    end

    def moves
        #Subclass implements this
        raise NotImplementedError
    end

    def pos=(val)
        @pos = val
    end

    def symbol
        #Subclass implements this
        raise NotImplementedError
    end

    private
    
    def move_into_check?(end_pos)

    end
end