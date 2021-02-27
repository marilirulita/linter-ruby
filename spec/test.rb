require_relative '../lib/linter_method'

describe SumofTwo do
  let(:something) { SumofTwo.new(5, 8) }
  describe '#adittion' do
    it 'return a number 13' do
      expect(something.adittion).to eql(13)
    end
  end
end
