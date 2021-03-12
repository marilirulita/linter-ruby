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

  def initial_block?(some)
    arr = [/^\s*class\s/, /^\s*def\s/, /^\s*if\s/, /do\s*$/, /do\s/]
    arr.each do |elem|
      return true if some =~ elem 
    end
  end

  def check_end
    m = 0
    file_data.each do |elem|
      if initial_block?(elem) == true
        m += 1
      elsif elem.include?('end')
        m -= 1
      end
    end
    return m
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


something = "defa  test_method(arg) {this is a block "
someth = "4.times don"

def new_method(some)
  arr = [/^\s*class\s/, /^\s*def\s/, /^\s*if\s/, /do\s*$/, /do\s/]
  arr.each do |elem|
    return true if some =~ elem 
  end
end

p "this is true" if new_method(someth) == true

=end