crabs = File.read("day7/input.txt").split(",").map(&:to_i)

def optimize(crabs)
  [*0..crabs.max].map { |x0| crabs.map{ (_1 - x0).abs }.sum }.min
end

puts optimize(crabs)
