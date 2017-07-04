t = gets
t = t.split(" ")
n = t[0]
s = t[1]
s = s.chomp()
s = s.to_i
n = n.to_i

ss = Array.new(30,"")

temp = ""
for i in 0..s-1
  temp = gets
  temp = temp.chomp()
  ss[i] = temp
  m = temp.size()
  m = m.to_i
end

a = Array.new(30) {Array.new(1000,0)}
b = Array.new(30) {Array.new(1000,0)}

for i in 1..s
  for j in 1..m
    if(ss[i-1][j-1] == '.')
      a[i][j] = 0
    else
      a[i][j] = 1
    end
  end
end

print "\n"
for i in 1..s
  for j in 1..m
    print "#{a[i][j]}"
  end
  print "\n"
end

for k in 1..n
  for i in 1..s
    for j in 1..m
      count = a[i-1][j-1] + a[i-1][j] + a[i-1][j+1] + a[i][j-1] + a[i][j+1] + a[i+1][j-1] + a[i+1][j] + a[i+1][j+1]

      if a[i][j] == 1
        if (count<2 || count>3)
          b[i][j] = 0
        else
          b[i][j] = 1
        end
      else
        if count == 3
          b[i][j] = 1
        else
          b[i][j] = 0
        end
      end
    end
  end

  print "\n"
  for i in 1..s
    for j in 1..m
      a[i][j] = b[i][j]
      print "#{a[i][j]}"
    end
    print "\n"
  end

end

for i in 1..s
  for j in 1..m
    if a[i][j] == 1
      print "X"
    else
      print "."
    end
  end
  print "\n"
end