class Test
  def test_method(arg)
    arg + arg
  end
end

something = "def test_method(arg)"
def new_method(some)
  arr = [/^\s*class\s/, /^\s*def\s/, /^\s*if\s/, /do\s*$/, /do\s/]
  seconda = 1
  secondb = 1
  if 2+6 == 3+4
    true
  else
    arr.each do |elem|
      return true if some =~ elem
    end
  end
  true if seconda != secondb
end
