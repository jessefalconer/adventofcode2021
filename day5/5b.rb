vectors = File.foreach("day5/input.txt").map { |row| row.gsub("\n", "").split(" -> ").map { _1.split(",").map(&:to_i) } }
intersections = []

def create_points(vector)
  x1, x2 = vector.collect { _1[0] }.sort
  y1, y2 = vector.collect { _1[1] }.sort

  if y1 == y2 # horizontal
    length = (x2 - x1).abs + 1
    coords = (x1..x2).zip(Array.new(length, y1))
  elsif x1 == x2 # vertical
    length = (y2 - y1).abs + 1
    coords = Array.new(length, x1).zip(y1..y2)
  else # diagonal
    x1, y1 = vector[0]
    x2, y2 = vector[1]
    domain = x1 < x2 ? (x1..x2) : x1.downto(x2)
    range  = y1 < y2 ? (y1..y2) : y1.downto(y2)

    coords = (domain).zip(range)
  end

  coords.map { _1.join(",") }
end

vectors.each_with_index do |v1, i|
  vectors[i+1..].each do |v2|
    v1_points = create_points(v1)
    v2_points = create_points(v2)

    intersections.push(*(v1_points & v2_points))
  end
end

puts intersections.uniq.count
