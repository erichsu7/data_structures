require_relative "node"

class DoublyLinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @head = Node.new
    @tail = Node.new(nil, nil, head)
    @head.next = tail
    @length = 0
  end

  def push(value)
    node = Node.new(value, tail, tail.prev)
    tail.prev.next = node
    tail.prev = node

    self.length += 1
    value
  end

  def pop
    return if length == 0

    popped_value = tail.prev.value
    tail.prev = tail.prev.prev
    tail.prev.next = tail

    self.length -= 1
    popped_value
  end

  def unshift(value)
  end

  def shift

  end

  def insert_after
  end

  def insert_before
  end

  def insert_at
  end

  def delete
  end

  def reverse!
  end

  def inspect
    values = []
    current_node = head.next

    until current_node == tail
      values << current_node.value
      current_node = current_node.next
    end

    values.join(" ")
  end

end
