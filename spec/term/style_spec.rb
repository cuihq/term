# cording: utf-8

require 'term/style'

RSpec.describe String do
  it '#reset reset all attributes' do
    expect('t'.reset).to eq "\e[0mt\e[0m"
  end

  it '#bold return blod string' do
    expect('t'.bold).to eq "\e[1mt\e[0m"
  end

  it '#reset_bold reset bold string' do
    expect('t'.reset_bold).to eq "\e[11mt\e[0m"
  end

  it '#dim return dim string' do
    expect('t'.dim).to eq "\e[2mt\e[0m"
  end

  it '#reset_dim reset dim string' do
    expect('t'.reset_dim).to eq "\e[12mt\e[0m"
  end

  it '#italicized return italicized string' do
    expect('t'.italicized).to eq "\e[3mt\e[0m"
  end

  it '#reset_italicized reset italicized string' do
    expect('t'.reset_italicized).to eq "\e[13mt\e[0m"
  end

  it '#underlined return underlined string' do
    expect('t'.underlined).to eq "\e[4mt\e[0m"
  end

  it '#reset_underlined reset underlined string' do
    expect('t'.reset_underlined).to eq "\e[14mt\e[0m"
  end

  it '#blink return blink string' do
    expect('t'.blink).to eq "\e[5mt\e[0m"
  end

  it '#reset_blink reset blink string' do
    expect('t'.reset_blink).to eq "\e[15mt\e[0m"
  end

  it '#inverse return inverse string' do
    expect('t'.inverse).to eq "\e[7mt\e[0m"
  end

  it '#reset_inverse reset inverse string' do
    expect('t'.reset_inverse).to eq "\e[17mt\e[0m"
  end

  it '#hidden return hidden string' do
    expect('t'.hidden).to eq "\e[8mt\e[0m"
  end

  it '#reset_hidden reset hidden string' do
    expect('t'.reset_hidden).to eq "\e[18mt\e[0m"
  end

  it '#crossed_out return crossed out string' do
    expect('t'.crossed_out).to eq "\e[9mt\e[0m"
  end

  it '#reset_crossed_out reset crossed out string' do
    expect('t'.reset_crossed_out).to eq "\e[19mt\e[0m"
  end
end
