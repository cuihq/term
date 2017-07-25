# cording: utf-8

require 'term/cursor'

RSpec.describe IO do
  subject { IO }

  it '#home move cursor to home position' do
    expect { subject.home }.to output("\e[H").to_stdout
  end

  it '#save save current cursor position & attrs' do
    expect { subject.save }.to output("\e7").to_stdout
  end

  it '#restore restore saved cursor position & attrs' do
    expect { subject.restore }.to output("\e8").to_stdout
  end

  it '#hide make cursor invisible' do
    expect { subject.hide }.to output("\e[?25l").to_stdout
  end

  it '#show make cursor visible' do
    expect { subject.show }.to output("\e[?25h").to_stdout
  end

  it '#to home-positioning to x and y coordinates' do
    expect { subject.to(x: 0, y:0) }.to output("\e[1;1H").to_stdout
  end

  it '#pos query cursor position' do
    subject.save
    expect(subject.to(x: 0, y:0).pos).to eq({x: 0, y:0})
    subject.restore
  end

  it '#up moves the cursor up by num rows' do
    expect { subject.up(1) }.to output("\e[1A").to_stdout
  end

  it '#down moves the cursor down by num rows' do
    expect { subject.down(1) }.to output("\e[1B").to_stdout
  end

  it '#forward moves the cursor forward by num columns' do
    expect { subject.forward(1) }.to output("\e[1C").to_stdout
  end

  it '#backward moves the cursor backward by num columns' do
    expect { subject.backward(1) }.to output("\e[1D").to_stdout
  end

  it '#next_line cursor next line num times' do
    expect { subject.next_line(1) }.to output("\e[1E").to_stdout
  end

  it '#prev_line cursor preceding line num times' do
    expect { subject.prev_line(1) }.to output("\e[1F").to_stdout
  end

  it '#clear can clear all screen' do
    expect { subject.clear }.to output("\e[2J").to_stdout
  end

  it '#clear_forward can clear line from current cursor position to end of line' do
    expect { subject.clear_forward }.to output("\e[K").to_stdout
  end

  it '#clear_backward clear line from beginning to current cursor position' do
    expect { subject.clear_backward }.to output("\e[1K").to_stdout
  end

  it '#clear_line can clear whole line' do
    expect { subject.clear_line }.to output("\e[2K").to_stdout
  end

  it '#clear_down can erase the screen from the current line down to the top of the screen' do
    expect { subject.clear_down }.to output("\e[J").to_stdout
  end

  it '#clear_up can erase the screen from the current line up to the top of the screen' do
    expect { subject.clear_up }.to output("\e[1J").to_stdout
  end
end
