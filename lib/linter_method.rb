class SumofTwo
  attr_accessor :numa, :numb

  def initialize(numa, numb)
    @numa = numa
    @numb = numb
  end

  def adittion
    numa + numb
  end
end

file = File.open('lib/tester.rb')
file_data2 = file.readlines.map(&:chomp)
p file_data2
file.close

File.foreach('lib/tester.rb') {|line| p line}
