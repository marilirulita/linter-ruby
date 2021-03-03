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

  def check_indentation
    #code for check correct indentation
  end

  def check_end
    #code for check if there is an end missing or unexpected
  end

  def check_bracket
    #code for check missing or unexpected bracket
  end

  def check_spaces
    #code for check double spaces or spaces at the end
  end

  def check_line
    #code for check missing lines or unexpected 
  end

end

some = TestFile.new('lib/tester.rb')
some.prints
