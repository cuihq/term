# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/table'

t = IO.table
t << ['adf', '中是']
t << [12, 'afs']
puts t.to_s
