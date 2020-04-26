require_relative "tile"

class Board

    def initialize(size = 9)
        @grid = Array.new(size) {Array.new(size)}
        fill_grid
        render
        sleep(5)
    end

    def [](pos)    #Get a tile from the grid
        x,y = pos
        return @grid[x][y]
    end

    def render
        print " "
        size.times {|x| print " " + x.to_s}
        puts ""
        @grid.each_with_index do |line, idx|
            print " "
            (size*2+1).times {print "-"}
            puts ""
            print idx
            line.each do |tile|
                if !tile.bombed?
                    print "| "
                else
                    print "|Q"
                end
            end
            puts "|"
        end
        print " "
        (size*2+1).times {print "-"}
        puts ""
    end

    private

    attr_reader :grid

    def fill_grid
        locs = bomb_locs
        (0..size-1).each do |x|
            (0..size-1).each do |y|
                if locs.include?([x,y])
                    pos = [x,y]
                    @grid[x][y] = Tile.new(pos,self,true)
                else
                    @grid[x][y] = Tile.new(pos,self)
                end
            end
        end
    end

    def bomb_locs
        num_bombs = size**2/8
        locs = Array.new
        while locs.size < num_bombs
            pos = rand(size),rand(size)
            locs << pos if !locs.include?(pos)
        end
        return locs
    end

    def size
        return @grid.length
    end

    def []=(pos,tile)
        x,y = pos
        @grid[x][y] = tile
        return true
    end

end