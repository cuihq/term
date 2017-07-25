# cording: utf-8

require 'term/table'

RSpec.describe IO do
  it '#table 制表' do
    t = IO.table << ['中', 2] << ['a', 'b']
    expect(t.to_s).to eq "┌--┬-┐\n│中│2│\n├--┼-┤\n│a │b│\n└--┴-┘\n"
  end
end
