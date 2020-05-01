require_relative 'tree_node.rb'

class KnightPathFinder

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end
    
    def build_move_tree 

    end

    def find_path(target_pos)

    end

    def self.valid_moves(pos)
        modifiers = [
            [-2,-1],
            [-2,1],
            [-1,-2],
            [-1,2],
            [1,-2],
            [1,2],
            [2,-1],
            [2,1]
        ]
        positions = Array.new
        modifiers.each do |mod|
            new_pos = [pos,mod].transpose.map {|x| x.reduce(:+)}
            positions << new_pos if new_pos.none? {|x| x < 0} && new_pos.none?{|x| x >= 8}
        end
        return positions
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
    end

end