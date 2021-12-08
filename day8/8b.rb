strs = File.read("day8/input.txt").split("\n")
signals = strs.each_with_object({}) { _2[_1.split(" | ")[0]] = _1.split(" | ")[1].split.map { |l| l.split("").sort.join } }

def translate(output, translations)
  return "1" if translations[0] == output
  return "2" if translations[1] == output
  return "3" if translations[2] == output
  return "4" if translations[3] == output
  return "5" if translations[4] == output
  return "6" if translations[5] == output
  return "7" if translations[6] == output
  return "8" if translations[7] == output
  return "9" if translations[8] == output
  return "0" if translations[9] == output
end

count = 0
signals.each do |signal|
  input, outputs = signal
  input = input.split(" ")
  one = input.find { _1.size == 2 }.split("").sort
  four = input.detect { _1.size == 4 }.split("").sort
  seven = input.detect { _1.size == 3 }.split("").sort
  eight = input.detect { _1.size == 7 }.split("").sort
  six_bars = input.select { _1.size == 6 }.map { _1.split("").sort }
  five_bars = input.select { _1.size == 5 }.map { _1.split("").sort }
  top_bar = seven - one
  bottom_bar = six_bars[0] & six_bars[1] & six_bars[2] - top_bar - four
  nine = (four + top_bar + bottom_bar).sort
  bottom_left_bar = eight - nine
  middle_bar = five_bars[0] & five_bars[1] & five_bars[2] - top_bar - bottom_bar
  zero = (eight - middle_bar).sort
  six = six_bars.reject { _1 == nine || _1 == zero }
  three = (seven + middle_bar + bottom_bar).sort
  two = five_bars.reject { _1 == three }.detect { _1.include?(bottom_left_bar[0])}
  five = five_bars.reject { _1 == three || _1 == two }
  translations = [one, two, three, four, five, six, seven, eight, nine, zero].map(&:join)

  count += outputs.map { translate(_1, translations) }.join.to_i
end

puts count
