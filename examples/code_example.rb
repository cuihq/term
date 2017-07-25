# cording: utf-8

railties_path = File.expand_path('../../lib', __FILE__)
$:.unshift(railties_path)

require 'term/code'

code_str = <<-EOF
# coding: utf-8

class A
  def b
    puts 'c'
  end
end
EOF

puts code_str.code 'ruby'
