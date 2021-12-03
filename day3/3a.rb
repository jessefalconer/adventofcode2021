binaries = File.read("day3/input.txt").split.map { |line| line.split("") }.transpose
gamma_rate = binaries.map { |arr| arr.max_by { |i| arr.count(i) } }
epsilon_rate = gamma_rate.map { |i| i == "1" ? "0" : "1" }

puts gamma_rate.join.to_i(2) * epsilon_rate.join.to_i(2)
