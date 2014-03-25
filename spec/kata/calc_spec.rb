require "./spec/spec_helper"

describe Kata::Calc do
  it "should add two numbers" do
    Calc.new.seven.plus.five.must_equal(12)
  end

  it "should subtract two numbers" do
    Calc.new.nineteen.minus.five.must_equal(14)
  end

  it "should multiply two numbers" do
    Calc.new.eleven.times.eleven.must_equal(121)
  end

  it "should divide two numbers" do
    Calc.new.twenty.divided_by.five.must_equal(4)
  end
end

