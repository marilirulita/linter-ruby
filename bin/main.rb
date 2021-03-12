require './lib/linter_method'


#some.check_indent
#some.check_end
#some.check_bracket
#some.check_doub_spaces



def prints
  some = TestFile.new('lib/tester.rb')
  puts "Line #{some.check_end_spaces}, there is an empty space at the end"
end

prints