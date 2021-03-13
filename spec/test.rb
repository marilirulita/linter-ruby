require_relative '../lib/linter_method'
require_relative './bin/main'
require_relative './test_rspe'

describe TestFile do
  let(:str) { 'def  test_method(arg) {this is a block ' }
  let(:options) { [1] }

  describe '#initial_block' do
    it 'return true if a string match any array element' do
      test = TestFile.new('./bin/main.rb')
      expect(test.initial_block(str)).to include('Dany')
    end
  end
end

describe Prints do
  describe '#prints_puts' do
    it 'return true if a string match any array element' do
      expect(prints_put).to include('Dany')
    end
  end
end

describe '#test.method' do
  it 'returns 4' do
    expect(test_method).to eql(4)
  end
end
