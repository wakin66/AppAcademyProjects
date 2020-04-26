require_relative "tile"

class Board

    def initialize(grid)
        @grid = from_file(grid)
    end

    def from_file(filename)
        grid = Array.new
            File.open(filename).each_line do |line|
                new_line = []
                line.chomp.each_char do |x|
                    if x == "0"
                        new_line << Tile.new(x,true)
                    else
                        new_line << Tile.new(x)
                    end
                end
                grid << new_line
            end
        return grid
    end

    def update_value(value,pos)
        @grid[pos[0]][pos[1]].change_value(value)
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
                if x.to_s == "0"
                    print "| "
                else
                    print "|#{x.to_s}"
                end
            end
            puts "|"
        end
        print " "
        (@grid.length*2+1).times {print "-"}
        puts ""
    end

    def get_square(start_loc)
        square = Array.new
        (0...3).each do |x|
            (0...3).each do |y|
                square << @grid[(start_loc[0]+x)][(start_loc[1]+y)]
            end
        end
        return square
    end

    def get_col(start_loc)
        col = Array.new
        (0...9).each {|x| col << @grid[x][start_loc]}
        return col
    end

    def solved?
        #Check Rows
        @grid.each do |row|
            return false if !array_solved?(row)
        end
        #Check Columns
        (0...9).each {|x| return false if !array_solved?(get_col(x))}
        #Check Squares
        [0,3,6].each do |x|
            [0,3,6].each do |y|
                return false if !array_solved?(get_square([x,y]))
            end
        end
        #If solved
        return true
    end

    def array_solved?(arr)
        new_arr = Array.new
        arr.each {|x| new_arr << x.value}
        (1..9).each {|x| return false if new_arr.count(x.to_s) != 1}
        return true
    end
end