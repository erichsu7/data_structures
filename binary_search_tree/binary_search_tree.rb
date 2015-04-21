require_relative "../binary_tree/binary_tree"

class BinarySearchTree < BinaryTree

  def initialize(root = nil)
    super(root)
  end

  def insert(value)
    unless root
      self.root = TreeNode.new(value)
      return value
    end

    current_node = root
    until current_node.nil?
      if value < current_node.value && current_node.left.nil?
        current_node.left = TreeNode.new(value)
        return value
      elsif value > current_node.value && current_node.right.nil?
        current_node.right = TreeNode.new(value)
        return value
      elsif value < current_node.value
        current_node = current_node.left
      elsif value > current_node.value
        current_node = current_node.right
      else
        return false
      end
    end
  end

  def includes?(value)
    current_node = root

    until current_node.nil?
      case value <=> current_node.value
      when -1
        current_node = current_node.left
      when 0
        return true
      when 1
        current_node = current_node.right
      end
    end

    false
  end

end
