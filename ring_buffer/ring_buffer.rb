class RingBuffer
  attr_accessor :size, :array, :count, :front_idx, :rear_idx

  def initialize(size = 8)
    @size = size
    @array = Array.new(size)
    @count = 0
    @front_idx = 0
    @rear_idx = -1
  end

  def push(value)
    resize_up if count == size

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
    resize_down if count <= size / 4
    shifted_value
  end

  def inspect
    array.join(", ")
  end

  private
    def resize_up
      larger_array = Array.new(size * 2)

      i = front_idx
      j = 0
      until i == rear_idx
        larger_array[j] = array[i]
        i = (i + 1) % size
        j += 1
      end
      larger_array[j] = array[i]

      self.front_idx = 0
      self.rear_idx = count - 1
      self.size = size * 2
      self.array = larger_array
    end

    def resize_down
      smaller_array = Array.new(size / 2)

      i = front_idx
      j = 0
      until i == rear_idx
        smaller_array[j] = array[i]
        i = (i + 1) % size
        j += 1
      end
      smaller_array[j] = array[i]

      self.front_idx = 0
      self.rear_idx = count - 1
      self.size = size / 2
      self.array = smaller_array
    end
end
