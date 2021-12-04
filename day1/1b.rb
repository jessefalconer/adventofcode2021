measurements = File.foreach("day1/input.txt").map(&:to_i).each_cons(3).map(&:sum)

puts measurements.each_cons(2).count { _2 > _1 }
