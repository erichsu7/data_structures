class Node
  attr_accessor :value, :visited, :edges

  def initialize(value)
    @value = value
    @visited = false
    @edges = []
  end

  def visit
    visited = true
  end

  def unvisit
    visited = false
  end
end
