# cording: utf-8

require 'term/redio'

RSpec.describe Array do

  subject { %w(file upyun) }

  describe '#redio' do
    it 'type enter return 0' do
      pos = IO.pos
      3.times do
        expect(IO).to receive(:pos).and_return(pos)
      end
      expect(IO).to receive(:input).and_return({key: :enter})
      res = nil
      expect { res = subject.redio }.to output.to_stdout
      expect(res).to eq 0
    end

    it 'type 0 and enter return 0' do
      pos = IO.pos
      5.times do
        expect(IO).to receive(:pos).and_return(pos)
      end
      expect(IO).to receive(:input).and_return({key: :'0'})
      expect(IO).to receive(:input).and_return({key: :enter})
      res = nil
      expect { res = subject.redio }.to output.to_stdout
      expect(res).to eq 0
    end

    it 'type 1 and enter return 1' do
      pos = IO.pos
      5.times do
        expect(IO).to receive(:pos).and_return(pos)
      end
      expect(IO).to receive(:input).and_return({key: :'1'})
      expect(IO).to receive(:input).and_return({key: :enter})
      res = nil
      expect { res = subject.redio }.to output.to_stdout
      expect(res).to eq 1
    end

    it 'type left and enter return 1' do
      pos = IO.pos
      5.times do
        expect(IO).to receive(:pos).and_return(pos)
      end
      expect(IO).to receive(:input).and_return({key: :left})
      expect(IO).to receive(:input).and_return({key: :enter})
      res = nil
      expect { res = subject.redio }.to output.to_stdout
      expect(res).to eq 1
    end

    it 'type tab and enter return 1' do
      pos = IO.pos
      5.times do
        expect(IO).to receive(:pos).and_return(pos)
      end
      expect(IO).to receive(:input).and_return({key: :tab})
      expect(IO).to receive(:input).and_return({key: :enter})
      res = nil
      expect { res = subject.redio }.to output.to_stdout
      expect(res).to eq 1
    end
  end
end
