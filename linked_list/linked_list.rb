require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :length

  def initialize
    @tail = Node.new
    @head = Node.new(nil, tail)
    @length = 0
  end

  def push(value)
    @tail.value = value
    @tail.next = Node.new
    @tail = tail.next

    self.length += 1
    value
  end

  def pop
    #O(n) for singly linked list, O(1) for doubly linked list because tail has reference to last element
    return if length == 0

    current_node = head.next

    until current_node.next == tail
      current_node = current_node.next
    end

    deleted_value = current_node.value
    current_node.value = nil
    current_node.next = nil
    self.tail = current_node

    self.length -= 1
    deleted_value
  end

  def unshift(value)
    @head.next = Node.new(value, head.next)

    self.length += 1
    value
  end

  def shift
    return if length == 0

    shifted_value = @head.next.value
    @head.next = head.next.next

    self.length -= 1
    shifted_value
  end

  def inspect
    values = []
    current_node = head.next

    until current_node.nil?
      values << current_node.value
      current_node = current_node.next
    end

    values.join(" ")
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
    return nil if head.next.nil? || value.nil?

    current_node = head.next
    until current_node.nil?
      if current_node.value == value
        current_node.value = current_node.next.value
        if current_node.next == tail
          current_node.next = nil
          self.tail = current_node
        else
          current_node.next = current_node.next.next
        end

        self.length -= 1
        return value
      end

      current_node = current_node.next
    end

    false
  end

  def reverse!
    length = self.length

    if length == 0
      return nil
    elsif length == 1
      return self
    else
      prev_node = head
      current_node = head.next

      until current_node.nil?
        next_node = current_node.next
        current_node.next = prev_node
        prev_node = current_node
        current_node = next_node
      end

      @head.next = nil
      @head, @tail = @tail, @head

      self
    end
  end
end
