def spawn_food(days)
  fishes = File.read("day6/input.txt").split(",").map(&:to_i)

  days.times do
    next_day = []

    fishes.each do |fish|
      if fish.zero?
        next_day.push *[6,8]
      else
        next_day << fish - 1
      end
    end

    fishes = next_day
  end

  fishes.count
end

puts spawn_food(256)
