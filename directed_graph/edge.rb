class Edge
  attr_reader :from_value, :to_value, :weight

  def initialize(from_value, to_value, weight = 1)
    @from_value = from_value
    @to_value = to_value
    @weight = weight
  end
end
