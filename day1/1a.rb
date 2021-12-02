measurements = File.foreach("day1/input.txt").map(&:to_i)

puts measurements.each_cons(2).count { |x| x[1] > x[0] }
