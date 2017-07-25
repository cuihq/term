# cording: utf-8

require 'artii'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class String
  # string fonts builder cache hash.
  class << self; attr_accessor :fonts end
  @fonts = {}

  # set the font.
  #
  # @note using `artii` gem.
  #   typing `artii -l` to see all fonts.
  # @example
  #   puts "term".font('big')
  # @param name [String] the font name
  # @return [String] string with the font style.
  def font(name)
    font_builder = self.class.fonts[name.to_s] ||= Artii::Base.new(font: name)
    font_builder.output self
  end
end
