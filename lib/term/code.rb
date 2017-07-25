# cording: utf-8

require 'rouge'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class String
  # a code syntax highlighter.
  #
  # @example Code
  #   code_str = <<-EOF
  #   class A
  #     def b
  #       puts 'c'
  #     end
  #   end
  #   EOF
  #   code_str.code 'ruby'
  # @see https://github.com/jneen/rouge rouge
  # @param name [String] the code name
  # @return [String] the format code string with color
  def code(name)
    Rouge.highlight(self, name.to_s, 'terminal256')
  end
end
