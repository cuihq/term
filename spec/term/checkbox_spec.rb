# cording: utf-8

require 'term/checkbox'

RSpec.describe Array do
  subject { %w(file upyun) }

  describe '#checkbox' do
    it 'type enter return []' do
      pos = IO.pos
      3.times do
        expect(IO).to receive(:pos).and_return(pos)
      end
      expect(IO).to receive(:input).and_return({key: :enter})
      res = nil
      expect { res = subject.checkbox }.to output.to_stdout
      expect(res).to eq []
    end
  end
end
