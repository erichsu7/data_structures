require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def length
    count = 0

    current_node = head
    until current_node.nil?
      count += 1
      current_node = current_node.next
    end

    count
  end

  def push(value)
    node = Node.new(value, nil)

    if head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def pop
  end

  def print
    current_node = head

    until current_node.nil?
      puts current_node.value
      current_node = current_node.next
    end
  end
end
