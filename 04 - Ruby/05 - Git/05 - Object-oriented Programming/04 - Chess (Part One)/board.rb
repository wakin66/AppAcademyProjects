require_relative 'pieces/piece'

class Board

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @sentinel = nil #change to NullPiece when class is written
        fill_board
    end

    def fill_board
        (0..7).each do |x|
            (0..7).each do |y|
                if [2,3,4,5].include? x #nullPieces
                    @rows[x][y] = nil
                elsif [1,6].include? x #Pawns
                    @rows[x][y] = Piece.new
                elsif [0,7].include? y #Rook
                    @rows[x][y] = Piece.new
                elsif [1,6].include? y #Knight
                    @rows[x][y] = Piece.new
                elsif [2,5].include? y #Bishop
                    @rows[x][y] = Piece.new
                elsif y == 3 #Queen
                    @rows[x][y] = Piece.new
                else #King
                    @rows[x][y] = Piece.new
                end
            end
        end
    end

    def [](pos)
        x,y = pos
        @rows[x][y]
    end

    def []=(pos,val)
        x,y = pos
        @rows[x][y] = val
    end

    def move_piece(color,start_pos,end_pos)

    end

    def valid_pos?(pos)

    end

    def add_piece(piece,pos)

    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end

    def dup

    end

    def move_piece!(color,start_pos,end_pos)

    end

end