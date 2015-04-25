class RingBuffer
  attr_accessor :size, :array, :count, :front_idx, :rear_idx

  def initialize(size = 16)
    @size = size
    @array = Array.new(size)
    @count = 0
    @front_idx = 0
    @rear_idx = -1
  end

  def push(value)
    return if count == size

    self.rear_idx = (rear_idx + 1) % size
    array[rear_idx] = value
    self.count += 1
    value
  end

  def shift
    return if count == 0

    shifted_value = array[front_idx]
    array[front_idx] = nil
    self.front_idx = (front_idx + 1) % size
    self.count -= 1
    shifted_value
  end

  def inspect
    array.join(", ")
  end
end
