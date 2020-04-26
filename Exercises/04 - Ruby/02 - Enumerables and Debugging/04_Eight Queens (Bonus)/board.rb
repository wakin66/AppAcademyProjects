class Board
attr_reader :size

    def initialize(size)
        @board = Array.new(size) {Array.new(size)}
        @size = size
    end

    def print_board
        print " "
        @size.times {|x| print " " + x.to_s}
        puts ""
        @board.each_with_index do |line, idx|
            print " "
            (@size*2+1).times {print "-"}
            puts ""
            print idx
            line.each do |x|
                if x == nil
                    print "| "
                else
                    print "|Q"
                end
            end
            puts "|"
        end
        print " "
        (@size*2+1).times {print "-"}
        puts ""
    end

    def get_position(position)
        return @board[position[0]][position[1]]
    end

    def clear_board
        @board = Array.new(@size) {Array.new(@size) {" "}}
    end
    
    def clear_position(position)
        @board[position[0]][position[1]] = nil
    end
    
    def empty?(position)
        @board[position[0]][position[1]] == nil ? true : false
    end

    def set_piece(position, piece)
        @board[position[0]][position[1]] = piece
    end
end