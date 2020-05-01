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

def test
    n1 = PolyTreeNode.new("root1")
    n2 = PolyTreeNode.new("root2")
    n3 = PolyTreeNode.new("root3")

    # connect n3 to n1
    n3.parent = n1
    # connect n3 to n2
    n3.parent = n2

    # this should work
    raise "Bad parent=!1" unless n3.parent == n2
    raise "Bad parent=!2" unless n2.children == [n3]

    # this probably doesn't
    raise "Bad parent=!3" unless n1.children == []
end