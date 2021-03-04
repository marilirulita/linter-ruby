class TestFile
  attr_accessor :file_data, :file_open

  def initialize(file)
    file_open = File.open(file)
    file_data = file_open.readlines.map(&:chomp)
    @file_open = file_open
    @file_data = file_data
  end

  def prints
    #prints data
    file_open.close
  end

  def check_indentation
    i = 0
    file_data.each_with_index do |elem, a|
      p elem
      if elem.include?("class ") && elem[0] == " "
        puts "line #{a + 1} There is an empty space at beginning"
      elsif elem.include?("def ") && elem[2] == " "
        puts "line #{a + 1} There is an empty space at beginning"
        i += 2
      elsif elem.include?("end") && elem[i] == " "
        puts "line #{a + 1} There is an empty space at beginning"
        i -= 2
      end
    end
  end

  def check_end
    m = 0
    options = ["class ", "def ", "if ", "do "]
    file_data.each_with_index do |elem, a|
      i = 0
      4.times do
        x = options[i].to_s
        if elem.include?(x)
          m += 1
        end
        i += 1
      end
      if elem.include?("end")
        m -= 1        
      end
    end
    if m > 0
      puts "There is a missing end"
    elsif m < 0
      puts "There is an unexpected end"
    end
  end

  def check_bracket
    #code for check missing or unexpected bracket
    options = [["(", ")"], ["{", "}"], ["[", "]"]]
    file_data.each_with_index do |elem, a|
      
    end
  end

  def check_spaces
    #code for check double spaces or spaces at the end
  end

  def check_line
    #code for check missing lines or unexpected 
  end

end

some = TestFile.new('lib/tester.rb')
#some.check_indentation
some.check_end
