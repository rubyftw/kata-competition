require "./spec/spec_helper"

$points = {}

describe Kata do
end

puts $points.map do |kata, points|
  "#{ kata }: #{ points } points\n"
end

puts "Total Points: #{ $points.values.inject(&:+) }"


