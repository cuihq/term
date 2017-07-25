# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/input'

puts 'click or input(type q to quit)：'
loop do
  key = IO.input
  break if key[:key] == :q
  p key
end
