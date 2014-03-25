require "./spec/spec_helper"

describe Kata do
  describe "::palindrome?" do

    it "should discern palindromes" do
      Kata.palindrome?("A man, a plan, a canal: Panama!").must_equal(true)
      Kata.palindrome?("Five six seven eight").must_equal(false)
      Kata.palindrome?("Race Car").must_equal(true)
      Kata.palindrome?("racecars").must_equal(false)
    end

  end
end
