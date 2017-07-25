# cording: utf-8

require 'term/font'

RSpec.describe String do
  it '#font set the font' do
    expect("a".font('big')).to eq "        \n        \n   __ _ \n  / _` |\n | (_| |\n  \\__,_|\n        \n        "
  end
end
