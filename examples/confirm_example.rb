# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/confirm'

puts "confirm (enter/cursor/mouse/space/tab/Y/N/y/n support）:"
res = "confirm".ok?
puts "val: #{res}"
