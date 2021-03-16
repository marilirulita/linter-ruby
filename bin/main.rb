require_relative '../lib/linter_method'

class Prints
  attr_reader :some, :size, :arg

  def initialize(arg)
    some = TestFile.new(arg)
    size = some.file_data.length
    @some = some
    @size = size
    @arg = arg
  end

  def prints_puts
    puts "-----------------------------------------------------"
    puts "File name: #{arg} \n\n"
    puts "Found errors: "
    some.file_data.each_with_index do |elem, a|
      puts "Line #{a + 1}, There is a space at the end. \n\n" if some.end_spaces(elem) == true
      puts "Line #{a + 1}, There is a double space between words. \n\n" if some.doub_spaces(elem) == true
      puts "line #{a + 1}, There are missing or unexpected curly braces.  \n\n" if some.curly_brace(elem) == true
      puts "line #{a + 1}, There is a missing or unexpected bracket. \n\n" if some.square_bracket(elem) == true
      puts "line #{a + 1}, There are missing or unexpected parentheses. \n\n" if some.check_parentheses(elem) == true
    end
  end

  def prints_end
    if some.unex_miss_end.positive?
      puts "Line #{size + 1}, There is a missing end. \n\n"
    elsif some.unex_miss_end.negative?
      puts "Line #{size + 1}, There is an unexpected end. \n\n"
    end
  end
end

test = Prints.new('./tests/tester_good.rb')
test.prints_puts
test.prints_end

test2 = Prints.new('./tests/tester_bad.rb')
test2.prints_puts
test2.prints_end
