# coding: utf-8

# @author {mailto:cuihaiqin@gmail.com cuihq}
class String
  # string colors.
  # @see http://www.termsys.demon.co.uk/vtansi.htm ANSI/VT100 Control sequences.
  COLOR = {
    black: 30,
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    magenta: 35,
    cyan: 36,
    light_gray: 37,
    default_color: 39,
    dark_gray: 90,
    light_red: 91,
    light_green: 92,
    light_yellow: 93,
    light_blue: 94,
    light_magenta: 95,
    light_cyan: 96,
    white: 97
  }.freeze

  # @!method black
  #   black string.
  #
  #   @return [String] the formatting string

  # @!method black_background
  #   black background string.
  #
  #   @return [String] the formatting string

  # @!method red
  #   red string.
  #
  #   @return [String] the formatting string

  # @!method red_background
  #   red background string.
  #
  #   @return [String] the formatting string

  # @!method green
  #   green string.
  #
  #   @return [String] the formatting string

  # @!method green_background
  #   green background string.
  #
  #   @return [String] the formatting string

  # @!method yellow
  #   yellow string.
  #
  #   @return [String] the formatting string

  # @!method yellow_background
  #   yellow background string.
  #
  #   @return [String] the formatting string

  # @!method blue
  #   blue string.
  #
  #   @return [String] the formatting string

  # @!method blue_background
  #   blue background string.
  #
  #   @return [String] the formatting string

  # @!method magenta
  #   magenta string.
  #
  #   @return [String] the formatting string

  # @!method magenta_background
  #   magenta background string.
  #
  #   @return [String] the formatting string

  # @!method cyan
  #   cyan string.
  #
  #   @return [String] the formatting string

  # @!method cyan_background
  #   cyan background string.
  #
  #   @return [String] the formatting string

  # @!method light_gray
  #   light gray string.
  #
  #   @return [String] the formatting string

  # @!method light_gray_background
  #   light gray background string.
  #
  #   @return [String] the formatting string

  # @!method default_color
  #   default color string.
  #
  #   @return [String] the formatting string

  # @!method default_color_background
  #   default color background string.
  #
  #   @return [String] the formatting string

  # @!method dark_gray
  #   dark gray string.
  #
  #   @return [String] the formatting string

  # @!method dark_gray_background
  #   dark gray background string.
  #
  #   @return [String] the formatting string

  # @!method light_red
  #   light red string.
  #
  #   @return [String] the formatting string

  # @!method light_red_background
  #   light red background string.
  #
  #   @return [String] the formatting string

  # @!method light_green
  #   light green string.
  #
  #   @return [String] the formatting string

  # @!method light_green_background
  #   light green background string.
  #
  #   @return [String] the formatting string

  # @!method light_yellow
  #   light yellow string.
  #
  #   @return [String] the formatting string

  # @!method light_yellow_background
  #   light yellow background string.
  #
  #   @return [String] the formatting string

  # @!method light_blue
  #   light blue string.
  #
  #   @return [String] the formatting string

  # @!method light_blue_background
  #   light blue background string.
  #
  #   @return [String] the formatting string

  # @!method light_magenta
  #   light magenta string.
  #
  #   @return [String] the formatting string

  # @!method light_magenta_background
  #   light magenta background string.
  #
  #   @return [String] the formatting string

  # @!method light_cyan
  #   light cyan string.
  #
  #   @return [String] the formatting string

  # @!method light_cyan_background
  #   light cyan background string.
  #
  #   @return [String] the formatting string

  # @!method white
  #   white string.
  #
  #   @return [String] the formatting string

  # @!method white_background
  #   white background string.
  #
  #   @return [String] the formatting string
  COLOR.each do |name, value|
    define_method(name) do
      "\e[#{value}m#{self}\e[0m"
    end
    define_method("#{name}_background") do
      "\e[#{10 + value}m#{self}\e[0m"
    end
  end

  # string color.
  #
  # @example color
  #   "mystring".color :black # keywords
  #   "mystring".color 123 # 256 colors
  #   "mystring".color '#000' # true color
  # @param name [Object] the color name
  # @return [String] the formatting string
  def color(name)
    set_256_color(name) || set_rbg_color(name) ||
      set_keyword_color(name) || self
  end

  # string background color.
  #
  # @example background color
  #   "mystring".background_color :black # keywords
  #   "mystring".background_color 123 # 256 colors
  #   "mystring".background_color '#000' # true color
  # @param name [Object] the background color name
  # @return [String] the formatting string
  def background_color(name)
    set_256_color(name, 48) || set_rbg_color(name, 48) ||
      set_keyword_color(name, '_background') || self
  end

  private

  # set 256 color.
  def set_256_color(name, num = 38)
    color_index = name.to_i
    "\e[#{num};5;#{color_index}m#{self}\e[0m" if color_index.between? 1, 256
  end

  # set rgb color.
  def set_rbg_color(name, num = 38)
    color_name = name.to_s
    if /^#(?<r>\h{1,2})(?<g>\h{1,2})(?<b>\h{1,2})$/ =~ color_name
      "\e[#{num};2;#{r.to_i(16)};#{g.to_i(16)};#{b.to_i(16)}m#{self}\e[0m"
    end
  end

  # set keyword color.
  def set_keyword_color(name, suffix = '')
    color_name = name.to_s.to_sym
    send "#{color_name}#{suffix}" if COLOR.key? color_name
  end
end
