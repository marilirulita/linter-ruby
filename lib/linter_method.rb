class TestFile
  attr_accessor :file_data, :file_open

  def initialize(file)
    file_open = File.open(file)
    file_data = file_open.readlines.map(&:chomp)
    @file_open = file_open
    @file_data = file_data
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

  def check_parentheses(some)
    first = some.scan(/\(/).length
    last = some.scan(/\)/).length
    first != last ? true : false
  end

  def square_bracket(some)
    first = some.scan(/\[/).length
    last = some.scan(/\]/).length
    first != last ? true : false
  end

  def curly_brace(some)
    first = some.scan(/\{/).length
    last = some.scan(/\}/).length
    first != last ? true : false
  end

  def doub_spaces(some)
    some.match?(/\w+\s{2}/)
  end

  def end_spaces(some)
    some[-1] == ' '
  end

  # This method will fix errors, maybe
  def write_doc
    File.open('lib/tester.rb', 'a') { |f| f.write "'Something new to share'\n" }
    File.write('lib/tester.rb', [1, 2, 3].join("\n"), mode: 'a')
    File.write('lib/tester.rb', 1, mode: 'a')
    File.stat('lib/tester.rb')
  end
end

=begin
  
test = TestFile.new('lib/tester.rb')
something = "def  test_method(arg) {this is a block "
def new_method(some)
  seconda = some.scan(/\{/).length
  secondb = some.scan(/\}/).length
  p "There is a missing or unexpected parenthesis or braket" if seconda != secondb
end

new_method(something)

=end
