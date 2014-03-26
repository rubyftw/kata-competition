class Snail

  def initialize(array)
    @array = array
  end

  def unroll
    return nil if @array.empty?
    return @array[0] if @array.size == 1
    new_array = []

    #top
    new_array << @array.delete_at(0)

    #right
    (0.upto(rows - 1)).each do |n|
      new_array << @array[n].delete_at(-1)
    end

    #bottom
    (cols - 1).downto(0).each do |n|
      puts @array.inspect
      puts @array[-1]
      new_array << @array.delete_at(-1).reverse
      puts new_array.inspect
    end

    #left
    (rows - 1).downto(0).each do |n|
      new_array << @array[n].delete_at[0]
    end

    new_array.flatten
  end

  def cols
    return 0 if @array.first.nil?
    @array.first.size
  end

  def rows
    @array.size
  end

  def iterate(n, k)
    if n >= k
      n.downto(k) {|j| yield j }
    else
      n.upto(k) {|j| yield j}
    end
  end

end
