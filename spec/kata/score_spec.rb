require "./spec/spec_helper"
require "bundler"
Bundler.require

$redis = Redis.new
RUN_ID = Time.now.to_i

def points(key, incr = nil)
  key = "kata_competition:#{ RUN_ID }:#{ key }"
  total = "kata_competition:#{ RUN_ID }:points"

  if incr
    $redis.incrby(key, incr)
    $redis.incrby(total, incr)
  else
    $redis.get(key)
  end
end

points(:snail_sort, 0)
points(:palindrome, 0)
points(:calculator, 0)

MiniTest::Unit.after_tests do
  puts "\n\n"
  puts "= POINTS ==========================="
  puts "Snail sort:              #{ points(:snail_sort).to_s.rjust(10) }"
  puts "Palindrome validator:    #{ points(:palindrome).to_s.rjust(10) }"
  puts "Method chain calculator: #{ points(:calculator).to_s.rjust(10) }"
  puts "------------------------------------"
  puts "Total Points:            #{ $redis.get("kata_competition:#{ RUN_ID }:points").to_s.rjust(10) }"
end

describe Kata do

  describe "::snail_sort" do
    it "should sort a 5x5 two-dimensional array" do
      array = [[  1,  2,  3,  4,  5 ],
               [  6,  7,  8,  9, 10 ],
               [ 11, 12, 13, 14, 15 ],
               [ 16, 17, 18, 19, 20 ],
               [ 21, 22, 23, 24, 25 ]]

      expected_result = [ 1, 2, 3, 4, 5, 10, 15, 20, 25, 24, 23, 22, 21, 16, 11, 6, 7, 8, 9, 14, 19, 18, 17, 12, 13 ]

      Kata.snail_sort(array).must_equal(expected_result)

      points(:snail_sort, 7)
    end

    it "should fill in nils for sub-arrays that are not as long as the longest sub-array" do
      array = [[ 1, 2 ],
               [ 3, 4, 5 ],
               [ 6 ]]

      expected_result = [ 1, 2, nil, 5, nil, nil, 6, 3, 4 ]

      Kata.snail_sort(array).must_equal(expected_result)

      points(:snail_sort, 4)
    end

    it "should snail sort arrays that are not square" do
      array = [[ 1, 2, 3, 4],
               [ 5, 6, 7, 8]]

      expected_results = [ 1, 2, 3, 4, 8, 7, 6, 5 ]

      Kata.snail_sort(array).must_equal(expected_results)

      points(:snail_sort, 4)
    end

    it "should sort a large, not-square array with sub-arrays of various lengths" do
      array = [[  15, 77, 75, 44, 97, 12, 36, 35, 81, 21 ],
               [ "33", "27", "51", "19", "74", "71", "40" ],
               [ 1, 2, 7, "hello", 99, Kata, "rubyftw", "for the win" ],
               [ Minitest, Integer, "\"", 999999999, ["a","b"] ]]

      expected_result = [15, 77, 75, 44, 97, 12, 36, 35, 81, 21, nil, nil, nil, nil, nil, nil, nil,
                         ["a", "b"], 999999999, "\"", Integer, Minitest, 1, "33",
                         "27", "51", "19", "74", "71", "40", nil, nil, nil, "for the win",
                         "rubyftw", Kata, 99, "hello", 7, 2]

      Kata.snail_sort(array).must_equal(expected_result)

      points(:snail_sort, 10)
    end
  end


  describe "::palindrome?" do
    it "should recognize palindromes" do
      palindrome?("abc123321cba").must_equal(true)

      points(:palindrome, 5)
    end

    it "should ignore non-alphanumeric characters" do
      palindrome?("&(*EUIEOUEH:NHXK&*EFOUGDdoaluei7cgandnagc7ieulaodDGUOFEKXHN:HEUOEIUE*(&").must_equal(true)

      points(:palindrome, 5)
    end

    it "should not allow non-palindromes" do
      palindrome?("No more pain").must_equal(false)

      points(:palindrome, 5)
    end

    it "should match a few big palindromes" do
      palindrome?("Are we not pure? “No sir!” Panama’s moody Noriega brags. “It is garbage!” Irony dooms a man; a prisoner up to new era.").must_equal(true)
      palindrome?("A man, a plan, a cat, a ham, a yak, a yam, a hat, a canal-Panama!").must_equal(true)
      palindrome?("A Toyota! Race fast, safe car! A Toyota!").must_equal(true)

      points(:palindrome, 10)
    end
  end

  describe Kata::Calc do

  end

end

