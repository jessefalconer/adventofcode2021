crabs = File.read("day7/input.txt").split(",").map(&:to_i)

def optimize(crabs)
  [*0..crabs.max].map do |x0|
    crabs.map do |x1|
      dist = (x1 - x0).abs

      dist + (0...dist).sum
    end.sum
  end.min
end

puts optimize(crabs)
