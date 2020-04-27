class Tile

    def initialize(pos,board,bomb = false)
        @bomb = bomb
        @pos = pos
        @flag = false
        @revealed = false
        @board = board
    end

    def bombed?
        @bomb
    end

    def flagged?
        @flag
    end

    def revealed?
        @revealed
    end

    def reveal
        @revealed = true
    end

    def flag
        flagged? ? @flag = false : @flag = true
    end

    def neighbors
        modifiers = [
            [-1,-1],
            [-1,0],
            [-1,1],
            [0,-1],
            [0,1],
            [1,-1],
            [1,0],
            [1,1]
        ]
        list = Array.new
        modifiers.each do |mod|
            neighbor_pos = mod.map.with_index {|x,idx| x+@pos[idx]}
            list << @board[neighbor_pos] if !neighbor_pos.include?(-1) && !neighbor_pos.include?(@board.size)
        end
        return list
    end

    def neighbor_bomb_count
        neighbors.count {|tile| tile.bombed?}
    end

end