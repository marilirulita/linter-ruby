require_relative '../lib/linter_method'

describe TestFile do
  let(:test) { TestFile.new('./tests/tester_bad.rb') }
  let(:test2) { TestFile.new('./bin/main.rb') }

  describe '#unex_miss_end' do
    it 'Return a positive num if there is a missing end.' do
      expect(test.unex_miss_end).to eql(1)
    end

    it 'Return cero if there is any missing end.' do
      expect(test2.unex_miss_end).to eql(0)
    end
  end

  describe '#check_parentheses' do
    it 'Return true if there is an unexpected parenthesis.' do
      expect(test.check_parentheses('something(abc))')).to be true
    end

    it 'Return false if there are correct open and close parentheses.' do
      expect(test.check_parentheses('something(abc)')).to be false
    end
  end

  describe '#square_bracket' do
    it 'Return true if there is a missing square bracket.' do
      expect(test.square_bracket('test = arr[1 ')).to be true
    end

    it 'Return false if there is a correct open and close square bracket.' do
      expect(test.square_bracket('test = arr[1] ')).to be false
    end
  end

  describe '#curly_brace' do
    it 'Return true if there is an unexpected curly brace.' do
      expect(test.curly_brace('arr.each { |ele| ele + 2 ')).to be true
    end

    it 'Return false if there is correct open and close curly brace.' do
      expect(test.curly_brace('arr.each { |ele| ele + 2 }')).to be false
    end
  end

  describe '#doub_spaces' do
    it 'Return true if there is double space between words.' do
      expect(test.doub_spaces('def  method_test(para)')).to be true
    end

    it 'Return false if there is not double space between words.' do
      expect(test.doub_spaces('def method_test(para)')).to be false
    end
  end

  describe '#end_spaces' do
    it 'Return true if there are one or more spaces at the end of the line.' do
      expect(test.end_spaces('class NewClass(param) ')).to be true
    end

    it 'Return false if there are no spaces at the end of the line.' do
      expect(test.end_spaces('class NewClass(param)')).to be false
    end
  end
end
