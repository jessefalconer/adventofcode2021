draws = File.read("day4/input.txt").split[0].split(",")
boards = File.read("day4/input.txt").split(/\n{2,}/)[1..].map(&:split)

def board_won?(board, draw)
  arr = board.each_slice(5).to_a

  (arr + arr.transpose).any? { |row| row.all?(nil) }
end

draws.each do |draw|
  boards.each do |board|
    if (position = board.index(draw))
      board[position] = nil
      abort "#{board.map(&:to_i).sum * draw.to_i}" if board_won?(board, draw)
    end
  end
end
