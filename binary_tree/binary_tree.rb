class BinaryTree
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def insert(value)
    current_node = self
    until current_node.nil?
      if value < current_node.value
        if current_node.left
          current_node = current_node.left
        else
          current_node.left = BinaryTree.new(value)
        end
      elsif value > current_node.value
      else
        return
      end
    end
  end
end
