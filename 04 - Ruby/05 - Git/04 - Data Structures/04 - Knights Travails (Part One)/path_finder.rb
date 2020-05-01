require_relative 'tree_node.rb'

class KnightPathFinder

    def initiate(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end
    
    def build_move_tree 

    end

    def find_path(target_pos)

    end

    def self.valid_moves(pos)
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
        positions = Array.new
        modifiers.each do |mod|
            neighbor_pos = mod.map.with_index {|x,idx| x+@pos[idx]}
            positions << @board[neighbor_pos] if !neighbor_pos.include?(-1) && !neighbor_pos.include?(@board.size)
        end
        return positions
    end

    def new_move_positions(pos)
        
    end

end