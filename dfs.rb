class AdjacencyListNode
  attr_accessor :data,:next
end

class AdjacencyList
  attr_accessor :head
end

class Graph
  def initialize(n)
    @number_of_vertices = n
    @adjacencylist = Array.new(n,nil)
  end

  def insert(v1,v2)
    temp = AdjacencyListNode.new
    temp.data = v2
    temp.next = @adjacencylist[v1]
    @adjacencylist[v1] = temp
  end

  def depth_first_search(source)
    temp = @adjacencylist[source]
    while(temp!=nil)
      if($visited_array[temp.data] == 0)
        dfs(temp.data)
      end
      temp =temp.next
    end
  end

  def print_list(source)
    print "#{source}->"
    temp = @adjacencylist[source]
    while(temp!=nil)
      print "#{temp.data} "
      temp =temp.next
    end
    print "\n"
  end

end

def dfs(source)
  if($visited_array[source] ==0)
    puts "#{source}"
    $visited_array[source] = 1
    $g.depth_first_search(source)
  end
end

$visited_array = Array.new(30,0)
$adjacency_list = Array.new(30) {Array.new(30,0)}

print "Enter number of vertices and edges:\n"
input = gets
input = input.split
$number_of_vertices = input[0].to_i
$number_of_edges = input[1].to_i

puts "Enter adjacent vertices"

$g = Graph.new($number_of_vertices)

for i in 1..$number_of_edges
  input = gets
  input = input.split
  vertex1 = input[0].to_i
  vertex2 = input[1].to_i
  $g.insert(vertex1,vertex2)
end

for i in 0..$number_of_vertices-1
  $g.print_list(i)
end

dfs(2)


=begin
for i in 1..$number_of_edges
  input = gets
  input = input.split
  vertex1 = input[0].to_i
  vertex2 = input[1].to_i
  $adjacency_list[vertex1][vertex2] = 1
  #$adjacency_list[vertex2][vertex1] = 1
end
=end

=begin
def dfs(source)
  if($visited_array[source] ==0)
    puts "#{source}"
    $visited_array[source] = 1
    for i in 0..$number_of_vertices
      if($adjacency_list[source][i] == 1 && $visited_array[i] == 0)
        dfs(i)
      end
    end
  end
end
=end