# cording: utf-8

require 'term/code'

RSpec.describe String do
  it '#code format code string' do
    expect("a = 1".code(:ruby)).to eq "\e[38;5;230ma\e[39m\e[38;5;230m \e[39m\e[38;5;87m=\e[39m\e[38;5;230m \e[39m\e[38;5;212;01m1\e[39;00m"
  end
end
