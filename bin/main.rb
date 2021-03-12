require './lib/linter_method'

# some.check_indent

def prints(arg)
  some = TestFile.new(arg)
  num = 0
  size = some.file_data.length

  some.file_data.each_with_index do |elem, a|
    puts "Line #{a + 1}, there is an empty space at the end" if some.end_spaces(elem) == true
    puts "Line #{a + 1}, there is a doble space between words" if some.doub_spaces(elem) == true
    puts "line #{a + 1}, There is a missing or unexpected curly braces" if some.curly_brace(elem) == true
    puts "line #{a + 1}, There is a missing or unexpected braket" if some.square_bracket(elem) == true
    puts "line #{a + 1}, There is a missing or unexpected parentheses" if some.check_parentheses(elem) == true
    num += 1 if some.initial_block?(elem) == true
    num -= 1 if some.check_end(elem) == true
  end
  return num, size
end

car = prints('lib/tester.rb')
if car[0].positive?
  puts "Line #{car[1] + 1}, There is a missing end"
elsif car[0].negative?
  puts "Line #{car[1] + 1}, There is an unexpected end"
end