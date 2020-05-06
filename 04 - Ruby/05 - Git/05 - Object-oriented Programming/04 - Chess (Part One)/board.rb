require_relative 'pieces'
require_relative 'custom_errors'

class Board

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @sentinel = NullPiece.instance
        fill_board
    end

    def fill_board
        (0..7).each do |x|
            (0..7).each do |y|
                pos = [x,y]
                if [2,3,4,5].include? x #nullPieces
                    self[pos] = NullPiece.instance
                elsif x == 1 #Black Pawns
                    self[pos] = Piece.new(:Black,self,pos)
                elsif x == 6 #White Pawns
                    self[pos] = Piece.new(:White,self,pos)
                elsif [0,7].include? y #Rook
                    self[pos] = Piece.new(:Black,self,pos) if x == 0
                    self[pos] = Piece.new(:White,self,pos) if x == 7
                elsif [1,6].include? y #Knight
                    self[pos] = Piece.new(:Black,self,pos) if x == 0
                    self[pos] = Piece.new(:White,self,pos) if x == 7
                elsif [2,5].include? y #Bishop
                    self[pos] = Piece.new(:Black,self,pos) if x == 0
                    self[pos] = Piece.new(:White,self,pos) if x == 7
                elsif y == 3 #Queen
                    self[pos] = Piece.new(:Black,self,pos) if x == 0
                    self[pos] = Piece.new(:White,self,pos) if x == 7
                else #King
                    self[pos] = Piece.new(:Black,self,pos) if x == 0
                    self[pos] = Piece.new(:White,self,pos) if x == 7
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

    def move_piece(start_pos,end_pos) #add color argument back later
        raise NoPieceError if self[start_pos].symbol == :nil
        raise EndPositionError.new "Cannot move piece to that location" if self[start_pos].moves.include?(end_pos)
        piece_to_move = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece_to_move
    end

    def valid_pos?(pos)
        x,y = pos
        return false if ![0,1,2,3,4,5,6,7].include? x
        return false if ![0,1,2,3,4,5,6,7].include? y
        return true
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
        list = Array.new
        (0..7).each do |x|
            (0..7).each do |y|
                pos = [x,y]
                list << self[pos] if self[pos].symbol != :nil && !list.include?(self[pos])
            end
        end
        return list
    end

    def dup

    end

    def move_piece!(color,start_pos,end_pos)

    end

end