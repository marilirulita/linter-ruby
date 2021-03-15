require './lib/linter_method'

# some.check_indent

class Prints
  attr_reader :some, :size

  def initialize(arg)
    some = TestFile.new(arg)
    size = some.file_data.length
    @some = some
    @size = size
  end

  def prints_puts
    some.file_data.each_with_index do |elem, a|
      puts "Line #{a + 1}, there is an empty space at the end \n\n" if some.end_spaces(elem) == true
      puts "Line #{a + 1}, there is a doble space between words \n\n" if some.doub_spaces(elem) == true
      puts "line #{a + 1}, There is a missing or unexpected curly braces \n\n" if some.curly_brace(elem) == true
      puts "line #{a + 1}, There is a missing or unexpected braket \n\n" if some.square_bracket(elem) == true
      puts "line #{a + 1}, There is a missing or unexpected parentheses \n\n" if some.check_parentheses(elem) == true
    end
  end

  def prints_end
    if some.unex_miss_end.positive?
      puts "Line #{size + 1}, There is a missing end \n\n"
    elsif some.unex_miss_end.negative?
      puts "Line #{size + 1}, There is an unexpected end \n\n"
    end
  end
end

test = Prints.new('lib/tester.rb')
test.prints_puts
test.prints_end
