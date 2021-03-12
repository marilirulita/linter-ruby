require './lib/linter_method'

# some.check_indent
# some.check_end

def prints
  some = TestFile.new('lib/tester.rb')
  size = some.file_data.length

  some.file_data.each_with_index do |elem, a|
    puts "Line #{a + 1}, there is an empty space at the end" if some.end_spaces(elem) == true
    puts "Line #{a + 1}, there is a doble space between words" if some.doub_spaces(elem) == true
    puts "line #{a + 1}, There is a missing or unexpected curly braces" if some.curly_brace(elem) == true
    puts "line #{a + 1}, There is a missing or unexpected braket" if some.square_bracket(elem) == true
    puts "line #{a + 1}, There is a missing or unexpected parentheses" if some.check_parentheses(elem) == true
  end

  if some.check_end.positive?
    puts "Line #{size + 1}, There is a missing end"
  elsif some.check_end.negative?
    puts "Line #{size + 1}, There is an unexpected end"
  end
end

prints
