strs = File.read("day8/input.txt").split("\n")
inputs = strs.each_with_object({}) { _2[_1.split(" | ")[0]] = _1.split(" | ")[1].split }

def correct_size(input)
  input.length == 2 || input.length == 4 || input.length == 3 || input.length == 7
end

puts inputs.values.map { |arr| arr.count { correct_size(_1) }  }.sum
