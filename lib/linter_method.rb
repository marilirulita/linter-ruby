class TestFile
  attr_accessor :file_data, :file_open

  def initialize(file)
    file_open = File.open(file)
    file_data = file_open.readlines.map(&:chomp)
    @file_open = file_open
    @file_data = file_data
  end

  def prints
    # prints data
    file_open.close
  end

  def check_indent
    file_data.each_with_index do |elem, a|
      if (elem.include?('class ') && elem[0] == ' ') || (elem.include?('def ') && elem[2] == ' ')
        puts "Line #{a + 1}, There is an empty space at beginning"
      end
    end
  end

  def check_end
    m = 0
    options = ['class ', 'def ', 'if ', 'do ']
    file_data.each_with_index do |elem, _a|
      i = 0
      4.times do
        x = options[i].to_s
        m += 1 if elem.include?(x)
        i += 1
      end
      m -= 1 if elem.include?('end')
    end
    if m.positive?
      puts 'There is a missing end'
    elsif m.negative?
      puts 'There is an unexpected end'
    end
    file_open.close
  end

  def check_bracket
    # code for check missing or unexpected bracket
    file_data.each_with_index do |elem, a|
      firsta = elem.scan(/\(/).length
      firstb = elem.scan(/\)/).length
      seconda = elem.scan(/\{/).length
      secondb = elem.scan(/\}/).length
      thirda = elem.scan(/\[/).length
      thirdb = elem.scan(/\]/).length
      if firsta != firstb || seconda != secondb || thirda != thirdb
        puts "line #{a + 1}, There is a missing or unexpected parenthesis or braket"
      end
    end
    file_open.close
  end

  def check_end_spaces
    # code for check double spaces or spaces at the end
    reg_doub_space = /\w+\s{2}/ # looks for double spaces after a word

    file_data.each_with_index do |elem, a|
      if elem.match?(reg_doub_space)
        puts "Line #{a + 1}, there is doble space"
        p elem
      end
    end
  end

  def check_doub_spaces
    file_data.each_with_index do |elem, a|
      if elem[-1] == ' '
        puts "Line #{a + 1}, there is an empty space at the end"
        p elem
      end
    end
  end

  # This method will fix errors, maybe
  def write_doc
    File.open('lib/tester.rb', 'a') { |f| f.write "'Something new to share'\n" }
    File.write('lib/tester.rb', [1, 2, 3].join("\n"), mode: 'a')
    File.write('lib/tester.rb', 1, mode: 'a')
    File.stat('lib/tester.rb')
  end
end

some = TestFile.new('lib/tester.rb')
some.check_indent
# some.check_end
# some.check_bracket
# some.check_spaces
