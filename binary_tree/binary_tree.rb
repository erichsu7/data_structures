require_relative "tree_node"

class BinaryTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    unless root
      self.root = TreeNode.new(value)
      return value
    end
    #
    # current_node = root
    # until current_node.nil?
    #   if value < current_node.value && current_node.left.nil?
    #     current_node.left = TreeNode.new(value)
    #     return value
    #   elsif value > current_node.value && current_node.right.nil?
    #     current_node.right = TreeNode.new(value)
    #     return value
    #   elsif value < current_node.value
    #     current_node = current_node.left
    #   elsif value > current_node.value
    #     current_node = current_node.right
    #   else
    #     return false
    #   end
    # end
    current_node = root
    until current_node.nil?
      if !current_node.left
        current_node.left = TreeNode.new(value)
        return value
      elsif !current_node.right
        current_node.right = TreeNode.new(value)
        return value
      elsif current_node.left.full?
        current_node = current_node.right
      else
        current_node = current_node.left
      end
    end
  end

  def print_tree #a breadth-first-like traversal
    queue = [root]
    children = []

    until queue.empty?
      puts queue.map { |node| node.value }.join(" ")

      queue_length = queue.length
      queue_length.times do |i|
        node = queue[i]
        node.left && children << node.left
        node.right && children << node.right
      end

      queue = children
      children = []
    end

    nil
  end

  def traverse_preorder(node = root)
    return if node.nil?
    puts node.value
    traverse_preorder(node.left)
    traverse_preorder(node.right)
  end

  def traverse_postorder(node = root)
    return if node.nil?
    traverse_postorder(node.left)
    traverse_postorder(node.right)
    puts node.value
  end

  def traverse_inorder(node = root)
    return if node.nil?
    traverse_inorder(node.left)
    puts node.value
    traverse_postorder(node.right)
  end

  def traverse_breadth_first

  end
end
