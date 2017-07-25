# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/cursor'

IO.clear
sleep 1
IO.to x: 5, y: 5
sleep 1
print 'o'
IO.up
IO.forward
print 'k'
sleep 1
IO.to x: 3, y: 3
sleep 1
print "11111"
sleep 1
IO.clear :down
sleep 1
print "22222"
sleep 1
IO.clear :backward
sleep 1
IO.to x: 5, y: 5

print "\e[31mss"
IO.save
print "\e[0mokssssss"
IO.restore
print "error\e[0m\n"

sleep 1
IO.hide
sleep 1
IO.show
