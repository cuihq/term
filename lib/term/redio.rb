# coding: utf-8

require 'term/cursor'
require 'term/input'

# @author {mailto:cuihaiqin@gmail.com cuihq}
module Enumerable
  # the redio Component.
  #
  # @example redio
  #   ['a', 'b', 7].redio
  # @return [Object] the redio val
  def redio
    size.times { print $/ }
    @begin_pos = IO.up(size).hide.pos
    process_input_redio
    IO.show
    @redio_res
  end

  private

  # print redio.
  def print_redio(index = 0)
    IO.to @begin_pos
    @redio_res = index.to_i % size
    @item_ys = []
    each_with_index do |item, num|
      print_redio_item item, num
    end
  end

  # print redio item.
  def print_redio_item(item, num)
    @item_ys[num] = IO.pos[:y]
    print "#{@redio_res == num ? '🔘' : '⭕️'} #{num}. #{item}#{$/}"
  end

  # process redio input.
  def process_input_redio
    print_redio
    @redio_loop = true
    while @redio_loop
      input = IO.input
      process_redio_mouse_click input
      process_redio_keyboard_input input[:key]
    end
  end

  # process redio mouse click event.
  def process_redio_mouse_click(input)
    if input[:type] == :left_pressed
      list_item = @item_ys.find_index input[:pos][:y]
      print_redio list_item if list_item
      @redio_loop = false
    end
  end

  # process redio keyboard input event.
  def process_redio_keyboard_input(key)
    case key
    when :enter then @redio_loop = false
    when /\d/ then print_redio(key.to_s)
    when :tab, :down, :left, :space then print_redio(@redio_res.succ)
    when :up, :right then print_redio(@redio_res.pred)
    end
  end
end
