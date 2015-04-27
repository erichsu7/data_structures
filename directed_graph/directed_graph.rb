require_relative 'edge'

class DirectedGraph
  attr_accessor :nodes, :node_count

  def initialize
    @nodes = Hash.new([])
    @node_count = 0
  end

  def add_node(value)
    return false if nodes[value]

    nodes[value] = Node.new(value)
    self.node_count += 1
    value
  end


  def add_edge(from_value, to_value, weight = 1)
    return false if find_edge(from_value, to_value)

    edge = Edge.new(from_value, to_value, weight)
    nodes[from_value].edges << edge
    true
  end

  def remove_edge
  end

  def find_edge(from_value, to_value)
    from_node = nodes[from_value]
    if from_node
      from_node.edges.each do |edge|
        return edge if edge.to_value == to_value
      end
    end

    nil
  end
end
