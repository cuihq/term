# cording: utf-8

require 'io/console'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class IO
  # set icon name and window title
  #
  # @example set the terminal icon name and window title
  #   IO.title = 'window title'
  # @return [Term] Term self.
  def self.title=(text = '')
    print "\e]0;#{text}\a"
    self
  end

  # set icon name
  #
  # @example set the terminal icon name
  #   IO.icon_name = 'icon title'
  # @return [Term] Term self.
  def self.icon_name=(text = '')
    print "\e]1;#{text}\a"
    self
  end

  # set window title
  #
  # @example set the terminal window title
  #   IO.window_title = 'window title'
  # @return [Term] Term self.
  def self.window_title=(text = '')
    print "\e]2;#{text}\a"
    self
  end

  # get window width.
  #
  # @return [Integer] the window width
  def self.width
    $stdout.winsize[1]
  end

  # get window height.
  #
  # @return [Integer] the window height
  def self.height
    $stdout.winsize[0]
  end
end
