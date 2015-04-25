require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @head = Node.new
    @tail = Node.new
    @length = 0
  end

  def push(value)
    @tail.value = value
    @tail.next = Node.new

    @head.next = @tail if head.next.nil?
    @tail = tail.next

    self.length += 1
    value
  end

  def pop
    popped_node = tail
    prev_node = nil
    current_node = head
    length = self.length

    if length == 1
      @head = nil
      @tail = nil
      return popped_node.value
    elsif length == 0
      return nil
    else
      while current_node.next
        prev_node = current_node
        current_node = current_node.next
      end

      @tail = prev_node
      prev_node.next = nil

      self.length -= 1
      popped_node.value
    end
  end

  def unshift(value)
    node = Node.new(value, head)

    if head.nil?
      @head = node
      @tail = node
    else
      @head = node
    end

    self.length += 1
    node.value
  end

  def shift
    if head
      node = @head
      @head = node.next
    end

    self.length -= 1
    node.value
  end

  def print_values
    current_node = head.next

    until current_node.nil?
      print current_node.value.to_s + " "
      current_node = current_node.next
    end

    nil
  end

  def delete(value)
    if head.nil?
      return nil
    end

    current_node = head
    prev_node = nil

    until current_node.nil? || current_node.value == value
      prev_node = current_node
      current_node = current_node.next
    end

    if current_node == head
      @head = current_node.next
    else
      prev_node.next = current_node.next
    end

    if current_node == tail
      @tail = prev_node
    end

    self.length -= 1
    current_node.value
  end

  def reverse
    length = self.length

    if length == 0
      return nil
    elsif length == 1
      return self.print
    else
      prev_node = nil
      current_node = head

      while current_node
        temp_node = current_node.next

        current_node.next = prev_node
        prev_node = current_node
        current_node = temp_node
      end

      @head.next = nil
      @head, @tail = @tail, @head

      self.print
    end
  end
end
