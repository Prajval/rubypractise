class GameOfLife
  def initialize(length,breadth,number_of_generations)
    @length = length
    @breadth = breadth
    @number_of_generations = number_of_generations
    @grid = Array.new(length+2) {Array.new(breadth+2,0)}
    @grid2 = Array.new(length+2) {Array.new(breadth+2,0)}
  end

  def convert_input_into_integer_array(input_array)
    for i in 1..@length
      for j in 1..@breadth
        if(input_array[i-1][j-1] == 'X')
          @grid[i][j] = 1
        end
      end
    end
  end

  def generate_next_generation()
    for k in 1..@number_of_generations
      for i in 1..@length
        for j in 1..@breadth
          count = @grid[i-1][j-1] + @grid[i-1][j] + @grid[i-1][j+1] + @grid[i][j-1] + @grid[i][j+1] +
              @grid[i+1][j-1] + @grid[i+1][j] + @grid[i+1][j+1]

          if(@grid[i][j] == 1)
            if (count<2 || count>3)
              @grid2[i][j] = 0
            else
              @grid2[i][j] = 1
            end
          else
            if count == 3
              @grid2[i][j] = 1
            else
              @grid2[i][j] = 0
            end
          end

        end
      end

      for i in 1..@length
        for j in 1..@breadth
          @grid[i][j] = @grid2[i][j]
        end
      end

    end
  end

  def print_current_generation
    for i in 1..@length
      for j in 1..@breadth
        if @grid[i][j] == 1
          print "X"
        else
          print "."
        end
      end
      print "\n"
    end
  end

  def get_input()
    puts "Enter input"
    input_array = Array.new(@length,"")
    for i in 0..@length-1
      input_array[i] = gets
      input_array[i].chomp
    end
    return input_array
  end

  def play()
    input_array = get_input
    convert_input_into_integer_array(input_array)

    for i in 1..@number_of_generations
      generate_next_generation
    end
    print_current_generation
  end

end

g = GameOfLife.new(6,18,5)
#g = GameOfLife.new(3,3,3)
g.play