require "./spec/spec_helper"

describe Kata do
  describe "::snail_sort" do

    it "should sort a two-dimensional arary like a snail" do
      array = [[ 1, 2, 3 ],
               [ 4, 5, 6 ],
               [ 7, 8, 9 ]]

      Kata.snail_sort(array).must_equal([1, 2, 3, 6, 9, 8, 7, 4, 5])
    end

    it "should allow non-square arrays" do
      array = [[ 1, 2, 3 ],
               [ 4, 5, 6 ]]

      Kata.snail_sort(array).must_equal([1, 2, 3, 6, 5, 4])
    end

    it "should allow arrays of different sub-lengths, using the longest as the length" do
      array = [[ 1, 2, 3, 4, 5 ],
               [ 7, 8, 9, 10, nil ],
               [ 11, 12, 13, nil, nil ]]

      Kata.snail_sort(array).must_equal([1, 2, 3, 4, 5, 6, nil, nil, nil, 13, 12, 11, 7, 8, 9, 10 ])
    end
  end
end
