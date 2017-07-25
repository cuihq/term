# cording: utf-8

require 'artii'

require 'benchmark'

n = 100

Benchmark.bm do |x|
  x.report do
    n.times { Artii::Base.new(font: 'big').output "a = 1" }
  end
  x.report do
    big_font = Artii::Base.new(font: 'big')
    n.times { big_font.output "a = 1" }
  end
end
