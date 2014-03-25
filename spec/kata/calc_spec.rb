require "./spec/spec_helper"

describe Kata::Calc do
  it "should add two numbers" do
    Kata::Calc.new.seven.plus.five.must_equal(12)
  end

  it "should subtract two numbers" do
    Kata::Calc.new.nineteen.minus.five.must_equal(14)
  end

  it "should multiply two numbers" do
    Kata::Calc.new.eleven.times.eleven.must_equal(121)
  end

  it "should divide two numbers" do
    Kata::Calc.new.twenty.divided_by.five.must_equal(4)
  end

  it "should go negative when subtracting a smaller number" do
    Kata::Calc.new.three.minus.seventeen.must_equal(-14)
  end
end

