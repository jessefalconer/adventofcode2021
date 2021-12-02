position = [0, 0] # x,y
aim = 0 # pitch?
File.foreach("day2/input.txt") do |line|
  command = line.split[0]
  vector = line.split[1].to_i

  case command
  when "forward"
    position[0] += vector
    position[1] += aim * vector
  when "up"
    aim -= vector
  when "down"
    aim += vector
  end
end

puts position.inject :*
