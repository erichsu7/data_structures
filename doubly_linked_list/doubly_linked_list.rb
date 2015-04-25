require_relative "node"

class DoublyLinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new(nil, nil, head)
    @head.next = tail
  end
end
