# coding: utf-8

require 'term/cursor'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class IO
  # get keybord & mouse key.
  #
  # @return [Hash] keybord & mouse key
  def self.input
    $stdin.raw do
      print "\e[?1000h" # DEC Private Mode Set
      str = $stdin.readpartial(4096).force_encoding('utf-8')
      print "\e[?1000l" # DEC Private Mode Reset
      parse_key_str str
    end
  end

  # keybord & mouse hash.
  KEY = {
    "\e[A" => :up,
    "\e[B" => :down,
    "\e[C" => :right,
    "\e[D" => :left,
    "\t" => :tab,
    "\r" => :enter,
    ' ' => :space,
    "\e\[M" => :mouse
  }.freeze

  # parse key str
  def self.parse_key_str(str)
    key = KEY[str[0, 3]] || str.to_sym
    if key == :mouse
      type, mouse_x, mouse_y = str[3, 3].unpack('CCC')
      type = %i(left_pressed scroll_down right_pressed released)[type & 0b11]
      { key: key, type: type, pos: { x: mouse_x - 33, y: mouse_y - 33 } }
    else
      { key: key }
    end
  end
end
