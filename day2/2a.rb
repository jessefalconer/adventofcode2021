position = [0, 0] # x,y
File.foreach("day2/input.txt") do |line|
  command = line.split[0]
  vector = line.split[1].to_i

  case command
  when "forward"
    position[0] += vector
  when "up"
    position[1] -= vector
  when "down"
    position[1] += vector
  end
end

puts position.inject :*
