# coding: utf-8

require 'term/input'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class IO
  # get password.
  #
  # @return [String] password
  def self.password
    @begin_password_pos = IO.hide.pos
    hide_password_text
    process_password_input
    IO.show
    @password_text || ''
  end

  # process password input event.
  def self.process_password_input
    @redio_loop = true
    while @redio_loop
      input = IO.input
      process_password_mouse_click input
      process_password_keyboard_input input[:key]
    end
  end
  private_class_method :process_password_input

  # process keyboard input event.
  def self.process_password_keyboard_input(key)
    @password_text ||= ''
    @password_text << key.to_s if key.size == 1
    @redio_loop = false if key == :enter
  end
  private_class_method :process_password_keyboard_input

  # process mouse click event.
  def self.process_password_mouse_click(input)
    type = input[:type]
    pos = input[:pos]
    if (type == :left_pressed) && (pos == @end_password_pos)
      show_password_text
    else
      hide_password_text
    end
  end
  private_class_method :process_password_mouse_click

  # hide password text.
  def self.hide_password_text
    IO.to(@begin_password_pos).clear_forward
    print '🔑 : ⚫ ⚫ ⚫ ⚫ ⚫ ⚫ ⚫ ⚫ 👁️'
    @end_password_pos ||= IO.pos
  end
  private_class_method :hide_password_text

  # show password text.
  def self.show_password_text
    IO.to(@begin_password_pos).clear_forward
    print "🔑 : #{@password_text || ''}"
  end
  private_class_method :show_password_text
end
