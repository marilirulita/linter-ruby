require './lib/linter_method'

some = TestFile.new('lib/tester.rb')
some.check_indent
some.check_end
some.check_bracket
some.check_end_spaces
some.check_doub_spaces
