# cording: utf-8

require 'term/input'

RSpec.describe IO do
  subject { IO }
  
  describe '#key_press' do
    it '按A键返回:A' do
      expect($stdin).to receive(:readpartial).and_return('A')
      expect(subject.input[:key]).to be :A
    end

    it '按a键返回:a' do
      expect($stdin).to receive(:readpartial).and_return('a')
      expect(subject.input[:key]).to be :a
    end

    it '按1键返回"1"' do
      expect($stdin).to receive(:readpartial).and_return('1')
      expect(subject.input[:key]).to eq :'1'
    end

    it '按左键返回:left' do
      expect($stdin).to receive(:readpartial).and_return("\e[C")
      expect(subject.input[:key]).to be :right
    end

    it '按Tab键返回:tab' do
      expect($stdin).to receive(:readpartial).and_return("\t")
      expect(subject.input[:key]).to eq :tab
    end

    it '按回车键返回:enter' do
      expect($stdin).to receive(:readpartial).and_return("\r")
      expect(subject.input[:key]).to eq :enter
    end

    it '按鼠标左键返回:mouse' do
      expect($stdin).to receive(:readpartial).and_return("\e[M !!")
      res = subject.input
      expect(res[:key]).to eq :mouse
      expect(res[:type]).to eq :left_pressed
      expect(res[:pos]).to eq({x: 0, y: 0})
    end
  end
end
