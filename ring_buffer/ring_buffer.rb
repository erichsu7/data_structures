class RingBuffer
  attr_accessor :size, :array, :count, :front_idx, :rear_idx

  def initialize(size = 16)
    @size = size
    @array = Array.new(size)
    @count = 0
    @front_idx = 0
    @rear_idx
  end

  def push(value)
    return if count == size
  end

  def shift
  end

end
