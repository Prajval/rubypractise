puts "Enter the number of generations: "
n = gets
n = n.chomp
n = n.to_i

puts "Enter the size of input: "
s = gets
s = s.chomp
s = s.to_i

puts "Enter the input array: "
input_array = Array.new(n,"")
for i in 0..s-1
  input_array[i] = gets
  input_array[i] = input_array[i].chomp
  m = input_array[i].size
  m = m.to_i
end

integer_pattern_array_1 = Array.new(s+2) {Array.new(m+2,0)}
integer_pattern_array_2 = Array.new(s+2) {Array.new(m+2,0)}

for i in 1..s
  for j in 1..m
    if(input_array[i-1][j-1] == 'X')
      integer_pattern_array_1[i][j] = 1
    end
  end
end

for k in 1..n
  for i in 1..s
    for j in 1..m
      count = integer_pattern_array_1[i-1][j-1] + integer_pattern_array_1[i-1][j] + integer_pattern_array_1[i-1][j+1] +
          integer_pattern_array_1[i][j-1] + integer_pattern_array_1[i][j+1] + integer_pattern_array_1[i+1][j-1] +
          integer_pattern_array_1[i+1][j] + integer_pattern_array_1[i+1][j+1]

      if integer_pattern_array_1[i][j] == 1
        if (count<2 || count>3)
          integer_pattern_array_2[i][j] = 0
        else
          integer_pattern_array_2[i][j] = 1
        end
      else
        if count == 3
          integer_pattern_array_2[i][j] = 1
        else
          integer_pattern_array_2[i][j] = 0
        end
      end

    end
  end

  for i in 1..s
    for j in 1..m
      integer_pattern_array_1[i][j] = integer_pattern_array_2[i][j]
    end
  end

end


for i in 1..s
  for j in 1..m
    if integer_pattern_array_1[i][j] == 1
      print "X"
    else
      print "."
    end
  end
  print "\n"
end
