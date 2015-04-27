class Node
  attr_accessor :value, :visited, :edges

  def initialize(value)
    @value = value
    @visited = false
    @edges = []
  end

  def visited?
    visited
  end

  def visit
    self.visited = true
  end

  def unvisit
    self.visited = false
  end
end
