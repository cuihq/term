# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/redio'

puts "redio (enter/cursor/mouse/space support）:"
arr = ['张三', 'Tom', 798]
res = arr.redio
puts "val: #{res}(#{arr[res]}) "
