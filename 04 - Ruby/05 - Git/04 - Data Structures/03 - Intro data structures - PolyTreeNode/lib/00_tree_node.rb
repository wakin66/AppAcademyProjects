class PolyTreeNode
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
end