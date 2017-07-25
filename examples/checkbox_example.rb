# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/checkbox'

puts "checkbox（tab/enter/cursor/mouse/space support）:"
arr = ['张三', 'Tom', 798]
res = arr.checkbox
puts "val: #{res}(#{arr.values_at *res})"
