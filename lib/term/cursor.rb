# coding: utf-8

require 'io/console'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class IO
  # move cursor to home position (0-0).
  #
  # @return [self] Term self.
  def self.home
    print "\e[H"
    self
  end

  # save current cursor position & attrs.
  #
  # @return [Term] Term self.
  def self.save
    print "\e7"
    self
  end

  # restore saved cursor position & attrs.
  #
  # @return [Term] Term self.
  def self.restore
    print "\e8"
    self
  end

  # make cursor invisible.
  #
  # @return [Term] Term self.
  def self.hide
    print "\e[?25l"
    self
  end

  # make cursor visible.
  #
  # @return [Term] Term self.
  def self.show
    print "\e[?25h"
    self
  end

  # query cursor position.
  #
  # @return [Hash] pos cursor position.
  def self.pos
    $stdin.raw do
      print "\e[6n"
      y_axis, x_axis = $stdin.gets('R')[2..-2].split(';')
      { x: x_axis.to_i - 1, y: y_axis.to_i - 1 }
    end
  end

  # home-positioning to x and y coordinates.
  # @param pos [Hash] opt the coordinates
  # @option opt [Integer] x the x coordinates, default 0
  # @option opt [Integer] y the y coordinates, default 0
  # @return [Term] Term self.
  def self.to(pos)
    x_axis = pos[:x] || 0
    y_axis = pos[:y] || 0
    print "\e[#{y_axis + 1};#{x_axis + 1}H" # ANSI uses 1-1 as home
    self
  end

  # moves the cursor up by num rows.
  #
  # @param num [Integer] the rows, the default num is 1.
  # @return [Term] Term self.
  def self.up(num = 1)
    print "\e[#{num}A" # CUU
    self
  end

  # moves the cursor down by num rows.
  #
  # @param num [Integer] the rows, the default num is 1.
  # @return [Term] Term self.
  def self.down(num = 1)
    print "\e[#{num}B" # CUD
    self
  end

  # moves the cursor forward by num columns.
  #
  # @param num [Integer] the columns, the default num is 1.
  # @return [Term] Term self.
  def self.forward(num = 1)
    print "\e[#{num}C" # CUF
    self
  end

  # moves the cursor backward by num columns.
  #
  # @param num [Integer] the columns, the default num is 1.
  # @return [Term] Term self.
  def self.backward(num = 1)
    print "\e[#{num}D" # CUB
    self
  end

  # cursor next line num times.
  #
  # @param num [Integer] the times, the default num is 1.
  # @return [Term] Term self.
  def self.next_line(num = 1)
    print "\e[#{num}E"
    self
  end

  # cursor preceding line num times.
  #
  # @param num [Integer] the times, the default num is 1.
  # @return [Term] Term self.
  def self.prev_line(num = 1)
    print "\e[#{num}F"
    self
  end

  # clear screen.
  #
  # @note cursor position unchanged
  # @return [Term] Term self.
  def self.clear
    print "\e[2J"
    self
  end

  # clear line from current cursor position to end of line.
  #
  # @note cursor position unchanged
  # @return [Term] Term self.
  def self.clear_forward
    print "\e[K"
    self
  end

  # clear line from beginning to current cursor position.
  #
  # @note cursor position unchanged
  # @return [Term] Term self.
  def self.clear_backward
    print "\e[1K"
    self
  end

  # clear whole line.
  #
  # @note cursor position unchanged
  # @return [Term] Term self.
  def self.clear_line
    print "\e[2K"
    self
  end

  # erase the screen from the current line up to the top of the screen.
  #
  # @note cursor position unchanged
  # @return [Term] Term self.
  def self.clear_up
    print "\e[1J"
    self
  end

  # erase the screen from the current line down to the top of the screen.
  #
  # @note cursor position unchanged
  # @return [Term] Term self.
  def self.clear_down
    print "\e[J"
    self
  end
end
