require_relative 'tile'
require 'colorize'

class Board
    attr_reader :size

    def initialize(size = 9)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
        @lost = false
        fill_grid
    end

    def [](pos)    #Get a tile from the grid
        x,y = pos
        return grid[x][y]
    end

    def render
        print " "
        size.times {|x| print " " + x.to_s}
        puts ""
        grid.each_with_index do |line, idx|
            print " "
            (size*2+1).times {print "-".on_light_black}
            puts ""
            print idx
            line.each do |tile|
                print "|".on_light_black+"#{print_tile(tile)}"
            end
            puts "|".on_light_black
        end
        print " "
        (size*2+1).times {print "-".on_light_black}
        puts ""
    end

    def game_over
        @lost = true
        reveal_all
        render
    end

    def won?
        (size**2) - @num_bombs == num_revealed
    end

    def lost?
        @lost
    end

    private

    attr_reader :grid

    def fill_grid
        locs = bomb_locs
        (0..size-1).each do |x|
            (0..size-1).each do |y|
                pos = [x,y]
                if locs.include?([x,y])
                    grid[x][y] = Tile.new(pos,self,true)
                else
                    grid[x][y] = Tile.new(pos,self)
                end
            end
        end
    end

    def bomb_locs
        @num_bombs = size**2/8
        locs = Array.new
        while locs.size < @num_bombs
            pos = rand(size),rand(size)
            locs << pos if !locs.include?(pos)
        end
        return locs
    end

    def []=(pos,tile)
        x,y = pos
        grid[x][y] = tile
        return true
    end

    def num_revealed
        grid.sum{|line| line.count {|tile| tile.revealed?}}
    end

    def print_tile(tile)
        (return "F".on_light_black) if tile.flagged?
        if tile.revealed?
            (return "X".red.on_red) if tile.bombed?
            if tile.neighbor_bomb_count == 0
                return " ".on_blue
            else
                return "#{tile.neighbor_bomb_count}".on_blue
            end
        else
            (return "X".red.on_light_black) if tile.bombed? && lost?
            return " "
        end
    end

    def reveal_all
        grid.each do |line|
            line.each do |tile|
                tile.reveal if !tile.bombed?
            end
        end
    end

end