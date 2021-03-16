class TestFile
  attr_reader :file_data, :file_open

  def initialize(file)
    file_open = File.open(file)
    file_data = file_open.readlines.map(&:chomp)
    @file_open = file_open
    @file_data = file_data
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
end
