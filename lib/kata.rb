require_relative './snail'
module Kata
  module_function

  def snail_sort(array)
    sorted = []
    while roll = Snail.new(array).unroll
      break if roll == []
      sorted = sorted + roll
    end
    sorted
  end

  def palindrome?(string)
  end

  class Calc
  end

end
