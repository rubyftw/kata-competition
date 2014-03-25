require "./spec/spec_helper"

describe Kata do
  describe "::snail_sort" do

    it "should sort a two-dimensional arary like a snail" do
      array = [[ 1, 2, 3 ],
               [ 4, 5, 6 ],
               [ 7, 8, 9 ]]

      Kata.snail_sort(array).must_equal([1, 2, 3, 6, 9, 8, 7, 4, 5])
    end
  end
end
