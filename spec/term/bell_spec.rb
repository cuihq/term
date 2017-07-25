# cording: utf-8

require 'term/bell'

RSpec.describe IO do
  it '#bell' do
    expect { IO.bell }.to output("\a").to_stdout
  end
end
