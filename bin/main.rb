require './lib/linter_method'

# some.check_indent
# some.check_end
# some.check_bracket

def prints
  some = TestFile.new('lib/tester.rb')

  some.file_data.each_with_index do |elem, a|
    puts "Line #{a + 1}, there is an empty space at the end" if some.check_end_spaces(elem) == true
    puts "Line #{a + 1}, there is a doble space between words" if some.check_doub_spaces(elem) == true
  end
end

prints
