class Edge
  attr_reader :from, :to, :weight
  
  def initialize(from, to, weight = 1)
    @from = from
    @to = to
    @weight = weight
  end
end
