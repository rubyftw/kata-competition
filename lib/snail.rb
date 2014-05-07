class Snail

  def initialize(array)
    max_size = array.map {|subarr| subarr.size}.max

    @array = array.map do |subarr|
      max_size.times { |idx| subarr[idx] = subarr[idx] }
      subarr
    end
  end

  def sort
    arr = @array.delete_at(0)
    while @array.size > 0
      @array = @array.transpose.reverse
      arr = arr + @array.delete_at(0)
    end
    arr
  end

end
