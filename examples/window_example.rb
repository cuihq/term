# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/window'

IO.window_title = 'window title'
IO.icon_name = 'icon name'
sleep 3
