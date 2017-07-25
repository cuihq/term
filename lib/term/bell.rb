# coding: utf-8

# @author {mailto:cuihaiqin@gmail.com cuihq}
class IO
  # ring a bell to a terminal.
  #
  # @example
  #   IO.bell
  # @return self
  def self.bell
    print "\a"
    self
  end
end
