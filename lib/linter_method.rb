class TestFile
  attr_reader :file_data, :file_open

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

  private

  def initial_block(some)
    arr = [/^\s*class\s/, /^\s*def\s/, /^\s*if\s/, /do\s*$/, /do\s/]
    arr.each do |elem|
      return true if some =~ elem
    end
  end

  def check_end(some)
    return true if some =~ /^\s*end\s*/
  end

  public

  def unex_miss_end
    num = 0
    file_data.each do |elem|
      num += 1 if initial_block(elem) == true
      num -= 1 if check_end(elem) == true
    end
    num
  end

  def check_parentheses(some)
    first = some.scan(/\(/).length
    last = some.scan(/\)/).length
    first != last
  end

  def square_bracket(some)
    first = some.scan(/\[/).length
    last = some.scan(/\]/).length
    first != last
  end

  def curly_brace(some)
    first = some.scan(/\{/).length
    last = some.scan(/\}/).length
    first != last
  end

  def doub_spaces(some)
    some.match?(/\w+\s{2}/)
  end

  def end_spaces(some)
    some[-1] == ' '
  end

  def write_doc
    File.open('lib/tester.rb', 'a') { |f| f.write "'Something new to share'\n" }
    File.write('lib/tester.rb', [1, 2, 3].join("\n"), mode: 'a')
    File.write('lib/tester.rb', 1, mode: 'a')
    File.stat('lib/tester.rb')
  end
end

# indentations ------------------------------------------
def check_indent(some)
  file_data.each_with_index do |elem, a|
    if (elem.include?('class ') && elem[0] == ' ') || (elem.include?('def ') && elem[2] == ' ')
      puts "Line #{a + 1}, There is an empty space at beginning"
    end
  end
end
# necesito identificar cada iniciador de indentation {class = 0, def = 0 if not class before, 2 if ther is a class before}
# for class
class_block = false
if some =~ /^\s*class/ && some[0] == ' '
  class_block = true # indica que se ha abrido un bloque
  return true # dara el mesaje de que hay mal indentation
end
check_indent