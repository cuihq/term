# cording: utf-8

require 'benchmark'

require 'unicode/display_width'

data = [["adf", "中是"], [12, "afs"]]
n = 10000

arr = data.transpose.map do |row|
  row.map { |cell| cell.to_s.display_width }.max
end
p arr

arr = []
data.each do |row|
  row.each_with_index do |cell, i|
    width = cell.to_s.display_width
    arr[i] = width if arr[i].to_i < width
  end
end
p arr

Benchmark.bm do |x|
  x.report do
    n.times do
      arr = []
      data.each do |row|
        row.each_with_index do |cell, i|
          width = cell.to_s.display_width
          arr[i] = width if arr[i].to_i < width
        end
      end
      arr
    end
  end

  x.report do
    n.times do
      data.transpose.map do |row|
        row.map { |cell| cell.to_s.display_width }.max
      end
    end
  end
end
