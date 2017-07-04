class Linked_list
  attr_accessor :val, :next
end

def insert(number)
  if($head == nil)
    $head = Linked_list.new
    $head.val = number
    $head.next = nil
    $current = $head
  else
    temp = Linked_list.new
    temp.val = number
    temp.next = nil
    $current.next = temp
    $current = temp
  end
end

def display_linked_list()
  temp = $head
  while(temp!=nil) do
    print temp.val
    temp = temp.next
  end
end

$head = nil
$current = nil

puts "Enter the numbers"
c = 1
$head = nil

while c==1 do
  number = gets
  number = number.chomp
  number = number.to_i
  if(number==-1)
    break
  end
  insert(number)
end

display_linked_list