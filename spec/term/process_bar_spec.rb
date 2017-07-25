# cording: utf-8

require 'term/process_bar'

RSpec.describe Integer do
  describe '#process_bar' do
    it '0 return 0% process bar' do
      expect(0.process_bar).to eq "[🛫#{'-' * ($stdout.winsize[1]-8)}]   0%"
    end

    it '50 return 50% process bar' do
      width = $stdout.winsize[1] - 8
      first = (50 / 100.0 * width).to_i
      expect(50.process_bar).to eq "[#{'-' * first}✈️#{'-' * (width - first)}]  50%"
    end

    it '100 return 100% process bar' do
      expect(100.process_bar).to eq "[#{'-' * ($stdout.winsize[1]-8)}🛬] 100%"
    end
  end
end
