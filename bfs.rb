class AdjacencyListNode
  attr_accessor :data,:next
  def initialize(x)
    @data = x
    @next = nil
  end
end

class  QueueNode
  attr_accessor :data,:next
  def initialize(d)
    @data = d
    @next = nil
  end
end

class Queue
  attr_accessor :front,:rear
  def initialize()
    @front = nil
    @rear = nil
  end

  def push(v)
    if(@front == nil)
      @front =  QueueNode.new(v)
      @rear = @front
    else
      @rear.next = QueueNode.new(v)
      @rear = @rear.next
    end
  end

  def pop()
    if(front == rear)
      @front = nil
      @rear = nil
    else
      @front = @front.next
    end
  end

  def is_empty()
    if(@front == nil)
      return true
    end
    return false
  end

end

class Graph
  def initialize(n)
    @adjacencyList = Array.new(n,nil)
  end

  def addEdge(v1,v2)
    if(@adjacencyList[v1] == nil)
      @adjacencyList[v1] = AdjacencyListNode.new(v2)
    else
      current = @adjacencyList[v1]
      while(current.next!=nil)
        current = current.next
      end
      current.next = AdjacencyListNode.new(v2)
    end
  end

  def printList()
    for i in 0..$number_of_vertices-1
      print "#{i} -> "
      current = @adjacencyList[i]
      while(current!=nil) do
        print "#{current.data} "
        current = current.next
      end
      print "\n"
    end
  end

  def bfs(s)
    q = Queue.new
    q.push(s)
    while(q.is_empty == false)
      t = q.front.data
      if($visited[t] == 0)
        puts "#{t}"
        $visited[t] = 1
        current = @adjacencyList[t]
        while(current!=nil) do
          temp = current.data
          if($visited[temp] == 0)
            q.push(temp)
          end
          current = current.next
        end
      end
      q.pop
    end
  end

end


$visited = Array.new(30,0)

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
  $g.addEdge(vertex1,vertex2)
end

$g.bfs(0)