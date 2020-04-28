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
        flagged? ? (return false) : (@revealed = true)
    end

    def flag
        (flagged? && !revealed?) ? @flag = false : @flag = true
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

    def reveal_empty
        list = neighbors
        list.each do |tile|
            if tile.neighbor_bomb_count == 0
                tile.neighbors.each {|neighbor| list << neighbor if !list.include?(neighbor)}
            end
        end
        list.each {|tile| tile.reveal}
        return true
    end

end