# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/style'

puts "asdfadfs".bold.crossed_out.italicized
