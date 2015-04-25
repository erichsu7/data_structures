require_relative "node"

class DoublyLinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @head = Node.new
    @tail = Node.new(nil, nil, head)
    @head.next = tail
    @length = 0
  end

  def first
    head.next.value
  end

  def last
    tail.prev.value
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
    node = Node.new(value, head.next, head)
    head.next.prev = node
    head.next = node

    self.length += 1
    value
  end

  def shift
    return if length == 0

    shifted_value = head.next.value
    head.next = head.next.next
    head.next.prev = head

    self.length -= 1
    shifted_value
  end

  def insert_after(value, new_value)
    return if length == 0

    current_node = head.next
    until current_node == tail
      if current_node.value == value
        node = Node.new(new_value, current_node.next, current_node)
        current_node.next.prev = node
        current_node.next = node

        self.length += 1
        return new_value
      end

      current_node = current_node.next
    end

    false
  end

  def insert_before(value, new_value)
    return if length == 0

    current_node = head.next
    until current_node == tail
      if current_node.value == value
        node = Node.new(new_value, current_node, current_node.prev)
        current_node.prev.next = node
        current_node.prev = node

        self.length += 1
        return new_value
      end

      current_node = current_node.next
    end

    false
  end

  def insert_at(idx, value)
    return if idx > length

    current_node = head.next
    idx.times do
      current_node = current_node.next
    end

    node = Node.new(value, current_node, current_node.prev)
    current_node.prev.next = node
    current_node.prev = node

    self.length += 1
    value
  end

  def delete(value)
    return if length == 0

    current_node = head.next
    until current_node == tail
      if current_node.value == value
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev

        self.length -= 1
        return value
      end

      current_node = current_node.next
    end

    false
  end

  def reverse!
    if length == 0
      return
    elsif length == 1
      return self
    else
      current_node = head

      until current_node.nil?
        next_node = current_node.next
        current_node.next, current_node.prev =
          current_node.prev, current_node.next

        current_node = next_node
      end

      @head, @tail = @tail, @head
      self
    end
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
