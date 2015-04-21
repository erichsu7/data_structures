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

end
