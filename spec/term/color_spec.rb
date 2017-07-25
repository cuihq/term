# cording: utf-8

require 'term/color'

RSpec.describe String do
  it '#black return black string' do
    expect('t'.black).to eq "\e[30mt\e[0m"
  end

  it '#black_background return black background string' do
    expect('t'.black_background).to eq "\e[40mt\e[0m"
  end

  it '#red return red string' do
    expect('t'.red).to eq "\e[31mt\e[0m"
  end

  it '#red_background return red background string' do
    expect('t'.red_background).to eq "\e[41mt\e[0m"
  end

  it '#green return green string' do
    expect('t'.green).to eq "\e[32mt\e[0m"
  end

  it '#green_background return green background string' do
    expect('t'.green_background).to eq "\e[42mt\e[0m"
  end

  it '#yellow return yellow string' do
    expect('t'.yellow).to eq "\e[33mt\e[0m"
  end

  it '#yellow_background return green background string' do
    expect('t'.yellow_background).to eq "\e[43mt\e[0m"
  end

  it '#blue return blue string' do
    expect('t'.blue).to eq "\e[34mt\e[0m"
  end

  it '#blue_background return blue background string' do
    expect('t'.blue_background).to eq "\e[44mt\e[0m"
  end

  it '#magenta return magenta string' do
    expect('t'.magenta).to eq "\e[35mt\e[0m"
  end

  it '#magenta_background return magenta background string' do
    expect('t'.magenta_background).to eq "\e[45mt\e[0m"
  end

  it '#cyan return cyan string' do
    expect('t'.cyan).to eq "\e[36mt\e[0m"
  end

  it '#cyan_background return cyan background string' do
    expect('t'.cyan_background).to eq "\e[46mt\e[0m"
  end

  it '#light_gray return light gray string' do
    expect('t'.light_gray).to eq "\e[37mt\e[0m"
  end

  it '#light_gray_background return light gray background string' do
    expect('t'.light_gray_background).to eq "\e[47mt\e[0m"
  end

  it '#default_color return default color string' do
    expect('t'.default_color).to eq "\e[39mt\e[0m"
  end

  it '#default_color_background return default color background string' do
    expect('t'.default_color_background).to eq "\e[49mt\e[0m"
  end

  it '#dark_gray return dark gray string' do
    expect('t'.dark_gray).to eq "\e[90mt\e[0m"
  end

  it '#dark_gray_background return dark gray background string' do
    expect('t'.dark_gray_background).to eq "\e[100mt\e[0m"
  end

  it '#light_red return light red string' do
    expect('t'.light_red).to eq "\e[91mt\e[0m"
  end

  it '#light_red_background return light red background string' do
    expect('t'.light_red_background).to eq "\e[101mt\e[0m"
  end

  it '#light_green return light green string' do
    expect('t'.light_green).to eq "\e[92mt\e[0m"
  end

  it '#light_green_background return light green background string' do
    expect('t'.light_green_background).to eq "\e[102mt\e[0m"
  end

  it '#light_yellow return light yellow string' do
    expect('t'.light_yellow).to eq "\e[93mt\e[0m"
  end

  it '#light_yellow_background return light green background string' do
    expect('t'.light_yellow_background).to eq "\e[103mt\e[0m"
  end

  it '#light_blue return light blue string' do
    expect('t'.light_blue).to eq "\e[94mt\e[0m"
  end

  it '#light_blue_background return light blue background string' do
    expect('t'.light_blue_background).to eq "\e[104mt\e[0m"
  end

  it '#light_magenta return light magenta string' do
    expect('t'.light_magenta).to eq "\e[95mt\e[0m"
  end

  it '#light_magenta_background return light magenta background string' do
    expect('t'.light_magenta_background).to eq "\e[105mt\e[0m"
  end

  it '#light_cyan return light cyan string' do
    expect('t'.light_cyan).to eq "\e[96mt\e[0m"
  end

  it '#light_cyan_background return light cyan background string' do
    expect('t'.light_cyan_background).to eq "\e[106mt\e[0m"
  end

  it '#white return white string' do
    expect('t'.white).to eq "\e[97mt\e[0m"
  end

  it '#white_background return white background string' do
    expect('t'.white_background).to eq "\e[107mt\e[0m"
  end

  describe '#color' do
    it 'return keyword color' do
      expect('t'.color('black')).to eq "\e[30mt\e[0m"
    end

    it 'return 256 color' do
      expect('t'.color(0)).to eq 't'
      expect('t'.color(220)).to eq "\e[38;5;220mt\e[0m"
      expect('t'.color(257)).to eq 't'
    end

    it 'return true color' do
      expect('t'.color('#000')).to eq "\e[38;2;0;0;0mt\e[0m"
      expect('t'.color('#fcfcfc')).to eq "\e[38;2;252;252;252mt\e[0m"
    end
  end

  describe '#background_color' do
    it 'return keyword color' do
      expect('t'.background_color('black')).to eq "\e[40mt\e[0m"
    end

    it 'return 256 color' do
      expect('t'.background_color(0)).to eq 't'
      expect('t'.background_color(220)).to eq "\e[48;5;220mt\e[0m"
      expect('t'.background_color(257)).to eq 't'
    end

    it 'return true color' do
      expect('t'.background_color('#000')).to eq "\e[48;2;0;0;0mt\e[0m"
      expect('t'.background_color('#fcfcfc')).to eq "\e[48;2;252;252;252mt\e[0m"
    end
  end
end
