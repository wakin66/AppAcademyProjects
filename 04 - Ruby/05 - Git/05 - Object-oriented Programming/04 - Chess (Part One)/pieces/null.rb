require_relative 'piece'
require 'singleton'

class NullPiece < Piece
    include Singleton

    def initialize
    end

    def symbol
        return :nil
    end

    def moves
        return Array.new
    end

end