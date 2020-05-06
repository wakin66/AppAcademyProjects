require_relative 'piece'
require 'singleton'

class NullPiece < Piece
    include Singleton

    def initialize
    end

    def symbol
        return :null
    end

    def moves
        return Array.new
    end

end