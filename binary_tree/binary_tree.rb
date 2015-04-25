require_relative "tree_node"

class BinaryTree
  attr_accessor :root, :count

  def initialize(root = nil)
    @root = root
    @count = 0
  end

  def insert(value)
    unless root
      self.root = TreeNode.new(value)
      return value
    end

    queue = [root]
    until queue.empty?
      node = queue.shift
      if !node.left
        node.left = TreeNode.new(value)
        return value
      elsif !node.right
        node.right = TreeNode.new(value)
        return value
      else
        node.left && queue << node.left
        node.right && queue << node.right
      end
    end
  end

  def draw #a breadth-first-like traversal
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

  def traverse
    traverse_inorder
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
    traverse_inorder(node.right)
  end

  def traverse_breadth_first
    queue = [root]
    until queue.empty?
      node = queue.shift
      puts node.value
      node.left && queue << node.left
      node.right && queue << node.right
    end
  end
end
