# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/color'

%w(black red green yellow blue magenta cyan light_gray default_color dark_gray
  light_red light_green light_yellow light_blue light_magenta light_cyan white).each do |v|
  print v.gsub('_', ' ').send(v)
  print ' '.send("#{v}_background")
  print v.gsub('_', ' ').color(v)
  puts ' '.background_color(v)
end

(1..256).each do |i|
  print sprintf("%4d", i).color(i)
end

(1..256).each do |i|
  print sprintf("%4d", i).background_color(i)
end

print '#fff'.color('#000')
p '#00ffff'.background_color('#ff00ff')
print "\e[48;2;ff;00;ffm#00ffff\e[0m"
