# coding: utf-8

require 'term/window'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class Numeric
  # get process bar.
  #
  # @example process bar
  #   print i.process_bar
  # @param width [Integer] process width
  # @return [String] process bar
  def process_bar(width = IO.width - 8)
    percent = format(' %3d%', self)
    line = '-' * width
    if self <= 0
      "[#{line.insert(0, '🛫')}]#{percent}"
    elsif self >= 100
      "[#{line.insert(-1, '🛬')}]#{percent}"
    else
      "[#{line.insert((self / 100.0 * width).to_i, '✈️')}]#{percent}"
    end
  end
end
