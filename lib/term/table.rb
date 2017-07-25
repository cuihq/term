# cording: utf-8

require 'unicode/display_width'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class IO
  # Table Component.
  class Table
    # the table border character.
    BORDER = {
      sep: '│',
      line: '-',
      top: ['┌', '┬', '┐'],
      mid: ['├', '┼', '┤'],
      bot: ['└', '┴', '┘']
    }.freeze

    def initialize
      @data = []
      @size = []
      @column_width = []
    end

    # add row to the table
    #
    # @param row [Array] the row to the table
    # @return [self] table self
    def <<(row)
      @data << row.map(&:to_s)
      @size << row.map { |cell| cell.to_s.display_width }
      self
    end

    # display table.
    #
    # @return [String] the table
    def to_s
      @column_width = calc_column_width
      res = get_border_row(BORDER[:top])
      res << @data.map { |row| get_content_row(row, BORDER[:sep]) }
             .join(get_border_row(BORDER[:mid]))
      res << get_border_row(BORDER[:bot])
    end

    private

    # get column width.
    def calc_column_width
      @size.transpose.map(&:max)
    end

    # get border row.
    def get_border_row(border)
      left, mid, right = border
      line = @column_width.map { |size| BORDER[:line] * size }.join(mid)
      "#{left}#{line}#{right}#{$/}"
    end

    # get content row.
    def get_content_row(row, sep)
      res = ''
      row.each_with_index do |cell, column|
        size = @column_width[column] - cell.display_width
        res << "#{cell}#{' ' * size}#{sep}"
      end
      "#{sep}#{res}#{$/}"
    end
  end

  # get table component.
  #
  # @return [Table] the table instance
  def self.table
    IO::Table.new
  end
end
