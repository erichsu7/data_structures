class Node
  attr_accessor :value, :visited

  def initialize(value)
    @value = value
    @visited = false
  end

  def visit
    visited = true
  end

  def unvisit
    visited = false
  end
end
