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

    node.value
  end

  def pop
  end

  def unshift(value)
    node = Node.new(value, head)

    if head.nil?
      @head = node
      @tail = node
    else
      @head = node
    end

    node.value
  end

  def shift
    if head
      node = @head
      @head = node.next
    end

    node.value
  end

  def print
    current_node = head

    until current_node.nil?
      p current_node.value
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

    current_node.value
  end
end
