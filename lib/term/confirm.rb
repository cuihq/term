# cording: utf-8

require 'term/redio'

require 'term/color'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class String

  def ok?
    print "#{self}? ".green
    @begin_confirm_pos = IO.hide.pos
    process_confirm_input
    IO.show
    @res
  end

  private

  # print confirm.
  def print_confirm(confirm, run)
    IO.to @begin_confirm_pos
    if @res = confirm
      print '✔'.red
      print ' ✖' if run
    else
      print '✔ ' if run
      print '✖'.red
    end
    @confirm_loop = run
  end

  # process confirm input confirm event.
  def process_confirm_input
    print_confirm(true, true)
    @confirm_loop = true
    while @confirm_loop
      input = IO.input
      process_confirm_mouse_click input
      process_confirm_keyboard_input input[:key]
    end
  end

  # process confirm mouse confirm event.
  def process_confirm_mouse_click(input)
    if (input[:type] == :left_pressed) && (input[:pos][:y] == @begin_confirm_pos[:y])
      if input[:pos][:x] == @begin_confirm_pos[:x]
        print_confirm(true, false)
      elsif input[:pos][:x] == @begin_confirm_pos[:x] + 2
        print_confirm(false, false)
      end
    end
  end

  # process confirm keyboard confirm event.
  def process_confirm_keyboard_input(key)
    case key
    when :enter then print_confirm(@res, false)
    when :Y, :y then print_confirm(true, false)
    when :N, :n then print_confirm(false, false)
    when :tab, :down, :left, :space, :up, :right then print_confirm(!@res, true)
    end
  end
end
