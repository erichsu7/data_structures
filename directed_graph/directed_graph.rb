require_relative 'edge'
require_relative 'node'

class DirectedGraph
  attr_accessor :nodes, :node_count

  def initialize
    @nodes = Hash.new([])
    @node_count = 0
  end

  def add_node(value)
    return false if nodes.has_key?(value)

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

  def remove_edge(from_value, to_value)
    edge = find_edge(from_value, to_value)
    return false if edge.nil?

    removed_edge =
      nodes[from_value].edges.delete_if { |edge| edge.to_value == to_value }

    removed_edge ? true : false
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

  def traverse_depth_first(start_value)
    unvisit_nodes

    traverse_depth_first_helper(start_value)
  end

  def traverse_depth_first_helper(start_value)
    current_node = nodes[start_value]
    return unless current_node
    return [] if current_node.visited?
    result = [current_node.value]
    current_node.visit
    current_node.edges.each do |edge|
      result += traverse_depth_first_helper(edge.to_value)
    end

    result
  end

  def traverse_breadth_first(start_value)
    unvisit_nodes
    result = []
    current_node = nodes[start_value]
    return unless current_node
    current_node.visit
    queue = [current_node]
    until queue.empty?
      current_node = queue.shift
      result << current_node.value
      current_node.edges.each do |edge|
        next_node = nodes[edge.to_value]
        next if next_node.visited?
        next_node.visit
        queue << next_node
      end
    end

    result
  end

  def unvisit_nodes
    nodes.each do |value, node|
      node.unvisit
    end
  end
end

dg = DirectedGraph.new
(1..6).each { |num| dg.add_node(num)}
dg.add_edge(1, 3)
dg.add_edge(1, 5)
dg.add_edge(3, 1)
dg.add_edge(3, 2)
dg.add_edge(3, 6)
dg.add_edge(3, 5)
dg.add_edge(2, 3)
dg.add_edge(2, 6)
dg.add_edge(6, 2)
dg.add_edge(6, 4)
dg.add_edge(6, 5)
dg.add_edge(4, 3)
dg.add_edge(4, 6)
dg.add_edge(5, 1)
dg.add_edge(5, 6)
p dg.traverse_breadth_first(1)
