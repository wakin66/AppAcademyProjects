class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = Array.new
        @value = value
    end

    def parent=(node)
        parent = node
        parent.add_child(self) if !parent.nil?
    end

    def add_child(child)
        children << child
    end

    def remove_child(child)
        children.delete(child)
    end
end