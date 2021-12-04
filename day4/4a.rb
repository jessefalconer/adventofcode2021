draws = File.read("day4/input.txt").split[0].split(",")
boards = File.read("day4/input.txt").split(/\n{2,}/)[1..].map(&:split)

draws.each do |draw|
  boards.each do |board|
    while (position = board.index(draw)) do
      board[position] = nil
    end

    arr = board.each_slice(5).to_a

    (arr + arr.transpose).each do |row|
      abort "#{arr.flatten.map(&:to_i).sum * draw.to_i}" if row.all?(nil)
    end
  end
end
