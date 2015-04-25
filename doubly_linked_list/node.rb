class Node
  attr_accessor :value, :next, :prev

  def initialize(value = nil, next_node = nil, prev_node = nil)
    @value = value
    @next = next_node
    @prev = prev_node
  end

end
