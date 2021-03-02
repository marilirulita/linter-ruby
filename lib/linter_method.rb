class TestFile
  attr_accessor :file_data, :file_open

  def initialize(file)
    file_open = File.open(file)
    file_data = file_open.readlines.map(&:chomp)
    @file_open = file_open
    @file_data = file_data
  end

  def prints
    file_data.each do |elem|
      p elem
    end
    file_open.close
  end

end

some = TestFile.new('lib/tester.rb')
some.prints
