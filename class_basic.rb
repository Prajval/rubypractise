class Hello
  def initialize(n)
    @name = n
  end
  def print_hello
    print"Hello #{@name}\n"
  end
end

t = gets
h = Hello.new(t)
h.print_hello