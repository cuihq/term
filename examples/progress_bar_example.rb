# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/process_bar'
require 'term/cursor'

101.times do |i|
  print i.process_bar
  sleep 0.01
  IO.clear_backward.up if i != 100
end
