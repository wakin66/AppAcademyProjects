require 'colorize'
require_relative 'cursor'

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        background = :light_black
        board.rows.each do |row|
            row.each do |sqr|
                print sqr.to_s.colorize(:background => background)
                background = background == :light_black ? :light_blue : :light_black
            end
            background = background == :light_black ? :light_blue : :light_black
            puts
        end
    end

end