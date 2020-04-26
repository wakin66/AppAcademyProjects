require_relative "card"

class Board

    def initialize
        @grid = Array.new(4) {Array.new(4)}
        populate
    end

    def populate
        pos_list = Array.new
        (0...4).each do |x|
            (0...4).each {|y| pos_list << [x,y]}
        end
        char = ["J","Q","K","A","C","S","N","Z"]
        char.each do |letter|
            2.times do
                x,y = pos_list.slice!(rand(pos_list.length))
                @grid[x][y] = Card.new(letter)
            end
        end
    end

    def render
        print " "
        @grid.length.times {|x| print " " + x.to_s}
        puts ""
        @grid.each_with_index do |line, idx|
            print " "
            (@grid.length*2+1).times {print "-"}
            puts ""
            print idx
            line.each do |x|
                if x.face_up == false
                    print "| "
                else
                    print "|#{x.value}"
                end
            end
            puts "|"
        end
        print " "
        (@grid.length*2+1).times {print "-"}
        puts ""
    end

    def won?
        @grid.each do |line|
            line.each do |card|
                return false if card.face_up == false
            end
        end
        return true
    end

    def reveal(pos)
        x,y = pos
        @grid[x][y].reveal if @grid[x][y].face_up == false
        return @grid[x][y]
    end

    def reveal_board
        (0...4).each do |x|
            (0...4).each do |y|
                reveal([x,y])
            end
        end
    end
end