# coding: utf-8

# @author {mailto:cuihaiqin@gmail.com cuihq}
class String
  # string formatting.
  # see ANSI/VT100 Control sequences.

  # reset all attributes.
  #
  # @return [String] formatting string
  def reset
    "\e[0m#{self}\e[0m"
  end

  # string styles.
  # see ANSI/VT100 Control sequences.
  STYLE = {
    bold: 1,
    dim: 2,
    italicized: 3,
    underlined: 4,
    blink: 5,
    inverse: 7,
    hidden: 8,
    crossed_out: 9
  }.freeze

  # @!method bold
  #   blod string.
  #
  #   @return [String] formatting string

  # @!method reset_bold
  #   reset bold string.
  #
  #   @see bold
  #   @return [String] formatting string

  # @!method dim
  #   dim string.
  #
  #   @return [String] formatting string

  # @!method reset_dim
  #   reset dim string.
  #
  #   @see dim
  #   @return [String] formatting string

  # @!method italicized
  #   italicized string.
  #
  #   @return [String] formatting string

  # @!method reset_italicized
  #   reset italicized string.
  #
  #   @see italicized
  #   @return [String] formatting string

  # @!method underlined
  #   underlined string.
  #
  #   @return [String] formatting string

  # @!method reset_underlined
  #   reset underlined string.
  #
  #   @see underlined
  #   @return [String] formatting string

  # @!method blink
  #   blink string.
  #
  #   does not work with most of the terminal emulators
  #   @note works in the tty and XIO.
  #   @return [String] formatting string

  # @!method reset_blink
  #   reset blink string.
  #
  #   @see blink
  #   @return [String] formatting string

  # @!method inverse
  #   nvert the foreground and background colors.
  #
  #   @return [String] formatting string

  # @!method reset_inverse
  #   reset inverse string.
  #
  #   @see inverse
  #   @return [String] formatting string

  # @!method hidden
  #   hidden string.
  #
  #   @note usefull for passwords.
  #   @return [String] formatting string

  # @!method reset_hidden
  #   reset hidden string.
  #
  #   @see hidden
  #   @return [String] formatting string

  # @!method crossed_out
  #   crossed out string.
  #
  #   @return [String] formatting string

  # @!method reset_crossed_out
  #   reset crossed out string.
  #
  #   @see crossed_out
  #   @return [String] formatting string
  STYLE.each do |name, value|
    define_method(name) do
      "\e[#{value}m#{self}\e[0m"
    end
    define_method("reset_#{name}") do
      "\e[#{10 + value}m#{self}\e[0m"
    end
  end
end
