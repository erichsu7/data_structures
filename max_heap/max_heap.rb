class MaxHeap
  attr_accessor :array, :count

  def initialize
    @array = []
    @count = 0
  end

  def left_child(idx)
    return if (idx * 2) + 1 > count
    array[(idx * 2) + 1]
  end

  def right_child(idx)
    return if (idx * 2) + 2 > count
    array[(idx * 2) + 2]
  end

  def parent(idx)
    return if idx < 1 || idx > count
    array[(idx - 1) / 2]
  end

end
