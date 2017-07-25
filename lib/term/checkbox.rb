# coding: utf-8

require 'term/cursor'
require 'term/input'

# @author {mailto:cuihaiqin@gmail.com cuihq}
module Enumerable
  # the checkbox widget.
  #
  # A checkbox allows a user to select same value from Enumerable.
  # @example
  #   ['a', 'b', 7].checkbox
  # @return [Array] the selected of values
  def checkbox
    size.times { print $/ }
    @begin_pos = IO.up(size).hide.pos
    @checkbox_res = []
    process_input_checkbox
    IO.show
    @checkbox_res
  end

  private

  # select checkbox item.
  def select_checkbox_item(index)
    index = index.to_s.to_i % size
    @checkbox_res.delete(index) || @checkbox_res.push(index)
    print_checkbox index
  end

  # print checkbox.
  def print_checkbox(index = 0)
    IO.to @begin_pos
    @res = index.to_s.to_i % size
    @item_ys = []
    each_with_index do |item, num|
      print_checkbox_item item, num
    end
  end

  # print checkbox item.
  def print_checkbox_item(item, num)
    @item_ys[num] = IO.pos[:y]
    num == @res ? print('➡️ ') : print('  ')
    if @checkbox_res.include? num
      print " ☑️ #{num}. #{item}#{$/}"
    else
      print " ⬜️ #{num}. #{item}#{$/}"
    end
  end

  # process checkbox input.
  def process_input_checkbox
    print_checkbox
    @checkbox_loop = true
    while @checkbox_loop
      input = IO.input
      process_checkbox_mouse_click input
      process_checkbox_keyboard_input input[:key]
    end
  end

  # process checkbox mouse click event.
  def process_checkbox_mouse_click(input)
    type = input[:type]
    pos = input[:pos]
    if type == :left_pressed
      list_item = @item_ys.find_index pos[:y]
      select_checkbox_item list_item if list_item
    end
  end

  # process checkbox keyboard input event.
  def process_checkbox_keyboard_input(key)
    case key
    when :enter then @checkbox_loop = false
    when /\d/ then select_checkbox_item(key)
    when :down then print_checkbox(@res.succ)
    when :up then print_checkbox(@res.pred)
    when :space, :right, :left, :tab
      select_checkbox_item @res
    end
  end
end
