require './lib/linter_method'

describe TestFile do
  let(:test) {TestFile.new('./lib/tester.rb')}
  let(:test2) {TestFile.new('./bin/main.rb')}

  describe '#unex_miss_end' do
    it 'return a positive num if there is a missing end' do
      expect(test.unex_miss_end).to eql(1)
    end

    it 'return cero if there is any missing end' do
      expect(test2.unex_miss_end).to eql(0)
    end
  end

  describe '#check_parentheses' do
    it 'return true if there is a unexpected parentheses' do
      expect(test.check_parentheses('something(abc))')).to be true
    end

    it 'return false if there is correct open and close parentheses' do
      expect(test.check_parentheses('something(abc)')).to be false
    end
  end

  describe '#square_bracket' do
    it 'return true if there is a missing square bracket' do
      expect(test.square_bracket('test = arr[1 ')).to be true
    end

    it 'return false if there is correct open and close square bracket' do
      expect(test.square_bracket('test = arr[1] ')).to be false
    end
  end

  describe '#curly_brace' do
    it 'return true if there is an unexpected curly brace' do
      expect(test.curly_brace('arr.each { |ele| ele + 2 ')).to be true
    end

    it 'return false if there is correct open and close curly brace' do
      expect(test.curly_brace('arr.each { |ele| ele + 2 }')).to be false
    end
  end

  describe '#doub_spaces' do
    it 'return true if there are double space between words' do
      expect(test.doub_spaces('def  method_test(para)')).to be true
    end

    it 'return false if there are not double space between words' do
      expect(test.doub_spaces('def method_test(para)')).to be false
    end
  end

  describe '#end_spaces' do
    it 'return true if there are one or more spaces at end of line' do
      expect(test.end_spaces('class NewClass(param) ')).to be true
    end

    it 'return false if there is not spaces at end of line' do
      expect(test.end_spaces('class NewClass(param)')).to be false
    end
  end
end
