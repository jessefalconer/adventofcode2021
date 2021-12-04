draws = File.read("day4/input.txt").split[0].split(",")
boards = File.read("day4/input.txt").split(/\n{2,}/)[1..].map(&:split)
queue = {}

draws.each do |draw|
  boards.each_with_index do |board, index|
    next if queue.keys.include? index

    while (position = board.index(draw)) do
      board[position] = nil
    end

    arr = board.each_slice(5).to_a

    (arr + arr.transpose).each do |row|
      if row.all?(nil)
        break queue[index] = board.flat_map(&:to_i).sum * draw.to_i
      end
    end
  end
end

puts queue[queue.keys.last]
