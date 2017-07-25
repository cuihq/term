# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/password'

puts 'Please input password（click 👁 to see password)：'
res = IO.password
puts "password: #{res}"
