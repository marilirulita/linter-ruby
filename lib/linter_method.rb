class TestFile
  attr_accessor :file_data, :file_open

  def initialize(file)
    file_open = File.open(file)
    file_data = file_open.readlines.map(&:chomp)
    @file_open = file_open
    @file_data = file_data
  end

  def prints
    i = 0
    file_data.each_with_index do |elem, a|
      p elem
      if elem.include?("class") && elem[0] == " "
        puts "line #{a + 1} There is an empty space"
      elsif elem.include?("def") && elem[2] == " "
        puts "line #{a + 1} There is an empty space"
        i += 2
      elsif elem.include?("end") && elem[i] == " "
        puts "line #{a + 1} There is an empty space"
        i -= 2
      end
    end
    file_open.close
  end

end

some = TestFile.new('lib/tester.rb')
some.prints
