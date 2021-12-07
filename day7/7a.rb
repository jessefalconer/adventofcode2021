crabs = File.read("day7/input.txt").split(",").map(&:to_i)

def optimize(crabs)
  y0 = (crabs.sort[(crabs.size - 1) / 2] + crabs.sort[crabs.size / 2]) / 2

  crabs.map { (_1 - y0).abs }.sum
end

puts optimize(crabs)
