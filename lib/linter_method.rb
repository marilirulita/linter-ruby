class TestFile
  attr_accessor :file_data

  def initialize(file)
    file_data = File.open(file).readlines.map(&:chomp)
    @file = file
    @file_data = file_data
  end

  def prints
    file_data.each do |elem|
      p elem
    end
  end
end

some = TestFile.new('lib/tester.rb')
some.prints
