require_relative '../lib/linter_method'

describe SumofTwo do
  let(:something) { SumofTwo.new(5, 8) }
  describe '#adittion' do
    it 'return a number 13' do
      expect(something.adittion).to eql(13)
    end
  end
end

describe TestFile do
  let(:array) { %w[Mar Dany Sofia] }

  describe '#initial_block' do
    it 'return true if a string match any array element' do
      expect(initial_block(array)).to include('Dany')
    end
  end

end

