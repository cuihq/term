# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
p railties_path
$:.unshift(railties_path)

require 'term/qrcode'

puts 'https://github.com'.qrcode
