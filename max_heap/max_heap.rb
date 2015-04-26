class MaxHeap
  attr_accessor :array, :count

  def initialize(array = [])
    @array = array
    @count = array.length
    heapify if count > 0
  end

  def get_left_child_idx(idx)
    return if (idx * 2) + 1 > count
    (idx * 2) + 1
  end

  def get_right_child_idx(idx)
    return if (idx * 2) + 2 > count
    (idx * 2) + 2
  end

  def get_parent_idx(idx)
    return if idx < 1 || idx > count
    (idx - 1) / 2
  end

  def insert(value)
    array[count] = value
    sift_up(count) if count > 0
    self.count += 1
    value
  end

  def sift_up(idx)
    parent_idx = get_parent_idx(idx)
    while !parent_idx.nil? && array[idx] > array[parent_idx]
      array[idx], array[parent_idx] = array[parent_idx], array[idx]
      idx = parent_idx
      parent_idx = get_parent_idx(idx)
    end

    nil
  end

  def sift_down(idx)
    return if idx < 0 || idx > (count - 2) / 2
    next_child_idx = get_left_child_idx(idx)
    #Check if left child is within array limits and if it's less than the right child.
    #Increment next_child_idx to that larger of children is swapped with element
    if next_child_idx < count - 1 && array[next_child_idx] < array[next_child_idx + 1]
      next_child_idx += 1
    end
    return if array[idx] >= array[next_child_idx]
    array[idx], array[next_child_idx] = array[next_child_idx], array[idx]
    sift_down(next_child_idx)

    nil
  end

  def remove(idx)
    return if idx < 0 || idx >= count

    array[idx], array[count - 1] = array[count - 1], array[idx]
    popped_value = array.pop
    self.count -= 1
    sift_up(idx)
    sift_down(idx)

    popped_value
  end

  def max
    array[0]
  end

  def shift
    remove(0)
  end

  private

    def heapify
      i = (count - 2) / 2
      while i >= 0
        sift_down(i)
        i -= 1
      end

      self
    end

end
