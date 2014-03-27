require "./spec/spec_helper"

describe Kata do
  describe "::palindrome?" do

    it "should discern simple palindromes" do
      Kata.palindrome?("racecar").must_equal(true)
      Kata.palindrome?("racecars").must_equal(false)
    end

    it "should allow numeric palindromes" do
      Kata.palindrome?("123454321").must_equal(true)
      Kata.palindrome?("121312121").must_equal(false)
    end

    it "should discern palindromes insensitive of case and whitespace" do
      Kata.palindrome?("Race Car").must_equal(true)
      Kata.palindrome?("12 34 54 32 1").must_equal(true)
      Kata.palindrome?("Five six seven eight").must_equal(false)
    end

    it "should discern palidromes with non alphanumeric characters" do
      Kata.palindrome?("A man, a plan, a canal: Panama!").must_equal(true)
    end

  end
end
