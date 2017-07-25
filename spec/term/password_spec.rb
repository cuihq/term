# cording: utf-8

require 'term/password'

RSpec.describe IO do
  it '#password return password' do
    pos = IO.pos
    expect(IO).to receive(:pos).and_return(pos)
    expect(IO).to receive(:pos).and_return(pos)
    expect(IO).to receive(:input).and_return({key: '1'.to_sym})
    expect(IO).to receive(:input).and_return({key: '中'.to_sym})
    expect(IO).to receive(:input).and_return({key: '@'.to_sym})
    expect(IO).to receive(:input).and_return({key: :enter})
    res = ''
    expect { res = IO.password }.to output.to_stdout
    expect(res).to eq "1中@"
  end
end
