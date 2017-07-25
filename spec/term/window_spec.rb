# cording: utf-8

require 'term/window'

RSpec.describe IO do
  subject {IO}
  it '#title set the terminal icon name and window title' do
    expect { subject.title = 'title' }.to output("\e]0;title\a").to_stdout
  end

  it '#icon_name= set the terminal icon name' do
    expect { subject.icon_name = 'title' }.to output("\e]1;title\a").to_stdout
  end

  it '#window_title= set the terminal window title' do
    expect { subject.window_title = 'title' }.to output("\e]2;title\a").to_stdout
  end

  it '#width get window width' do
    expect(subject.width).to be > 0
  end

  it '#height get window height' do
    expect(subject.height).to be > 0
  end
end
