measurements = File.foreach("input.txt").map { |line| line.to_i }

puts measurements[1..measurements.size-1].zip(measurements[0..-2]).flat_map { |x| x.reduce :- }.count(&:positive?)
