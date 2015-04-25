class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def full?
    !left.nil? && !right.nil?
  end

  def leaf?
    left.nil? && right.nil?
  end
end
