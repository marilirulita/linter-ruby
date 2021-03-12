require './lib/linter_method'


#some.check_indent
#some.check_end
#some.check_bracket
#

def prints
  some = TestFile.new('lib/tester.rb')
  
  some.check_end_spaces.each do |elem|
    puts "Line #{elem}, there is an empty space at the end"
  end

  some.check_doub_spaces.each do |elem|
    puts "Line #{elem}, there is a doble space"
  end

end

prints