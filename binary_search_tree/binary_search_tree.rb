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

  def includes?(value, node = root)
    return false if node.nil?
    return true if node.value == value

    includes?(value, node.left) || includes?(value, node.right)
  end

  def min(node = root)
    return if root.nil?
    return node.value if node.leaf?

    min(node.left)
  end

  def max(node = root)
    return if root.nil?
    return node.value if node.leaf?

    max(node.right)
  end

  def min_node(node = root)
    return if root.nil?
    return node if node.leaf?

    min(node.left)
  end

  def max_node(node = root)
    return if root.nil?
    return node if node.leaf?

    max(node.right)
  end

  def remove(value, node = root)
    return if node.nil?

    if value < node.value
      node.left = remove(value, node.left)
    elsif value > node.value
      node.right = remove(value, node.right)
    else #found the node
      if node.left.nil? #returns the right node (one child) or nil (no children)
        return node.right
      elsif node.right.nil?
        return node.left
      else
        next_node = max_node(node.left)
        node.value = next_node.value
        remove(node.value, node.left)
      end
    end

    return node
  end

  def remove_helper(value, node = root)

  end

end
