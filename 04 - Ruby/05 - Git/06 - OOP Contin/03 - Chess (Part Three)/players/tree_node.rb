class TreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = Array.new
        @value = value
    end

    def parent=(node)
        return node if parent == node
        old_parent = parent
        @parent = node
        node.add_child(self) if !node.nil?
        old_parent.remove_child(self) if !old_parent.nil?
    end

    def add_child(child)
        return child if children.include?(child)
        children << child
        child.parent = self
    end

    def remove_child(child)
        raise "Bad remove_child!" unless children.include?(child)
        children.delete(child)
        child.parent = nil if child.parent == self
    end

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            result = child.dfs(target_value)
            return result if !result.nil?
        end
        return nil
    end

    def bfs(target_value)
        queue = Array.new
        queue << self
        while !queue.empty?
            node = queue.shift
            return node if node.value == target_value
            node.children.each {|child| queue << child}
        end
        return nil
    end
end