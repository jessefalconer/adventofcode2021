draws = File.read("day4/input.txt").split[0].split(",")
boards = File.read("day4/input.txt").split(/\n{2,}/)[1..].map(&:split)
queue = {}

def board_won?(board, draw)
  arr = board.each_slice(5).to_a

  (arr + arr.transpose).any? { |row| row.none? }
end

draws.each do |draw|
  break if boards.size == queue.size

  boards.each_with_index do |board, index|
    next if queue.keys.include? index

    if (position = board.index(draw))
      board[position] = nil
      queue[index] = board.map(&:to_i).sum * draw.to_i if board_won?(board, draw)
    end
  end
end

puts queue[queue.keys.last]
