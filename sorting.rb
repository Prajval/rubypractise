#BUBBLESORT STARTS

def bubble_sort(n,a)
  puts("BubbleSort")
  for i in 0..n-2
    for j in 0..n-i-2
      if(a[j]>a[j+1])
        temp = a[j]
        a[j] = a[j+1]
        a[j+1] = temp
      end
    end
  end

  for i in 0..n-1
    print a[i]
  end
  print "\n"

end

#BUBBLESORT ENDS


#INSERTION SORT STARTS

def insertion_sort(n,a)
  puts "Insertion Sort"
  for i in 1..n-1
    k = a[i]
    j = i-1
    while j>=0 && k < a[j] do
      a[j+1] = a[j]
      j = j-1
    end
    a[j+1] = k
  end
  for i in 0..n-1
    print a[i]
  end
  print "\n"
end

#SELECION SORT ENDS


#SELECION SORT STARTS

def selection_sort(n,a)
  for i in 0..n-2
    minimum_index = i
    key = a[i]
    for j in i+1..n-1
      if a[j] < a[minimum_index]
        minimum_index = j
      end
    end
    a[i] = a[minimum_index]
    a[minimum_index] = key
  end
  for i in 0..n-1
    print a[i]
  end
  print "\n"
end

#SELECION SORT ENDS


#QUICK SORT STARTING

def partition(a,p,r)
  i = p-1
  key = a[r]
  for j in p..r-1
    if(a[j]<=key)
      i = i + 1
      temp = a[i]
      a[i] = a[j]
      a[j] = temp
    end
  end
  temp = a[i+1]
  a[i+1] = a[r]
  a[r] = temp
  return i+1
end

def qsort(a,p,r)
  if(p<r)
    q = partition(a,p,r)
    qsort(a,p,q-1)
    qsort(a,q+1,r)
  end
end

def quick_sort(n,a)
  puts("Quicksort")
  qsort(a,0,n-1)
  puts(a)
end

#QUICKSORT - ENDING


#HEAPSORT STARTS

def left(i)
  return 2*i
end

def right(i)
  return 2*i + 1
end

def parent(i)
  return i/2
end

def max_heapify(a,i,n)
  largest = i
  l = left(i)
  r =right(i)

  if(l<=n)
    if(a[l]>a[largest])
      largest = l
    end
  end

  if(r<=n)
    if(a[r]>a[largest])
      largest = r
    end
  end

  if(largest!=i)
    temp = a[i]
    a[i] = a[largest]
    a[largest] = temp
    max_heapify(a,largest,n)
  end

end

def build_max_heap(a,n)
  i = n/2
  while i>=1 do
    max_heapify(a,i,n)
    i = i - 1
  end

end

def heapsort(n,a)

  i = n
  while i>=1 do
    a[i] = a[i-1]
    i = i - 1
  end

  puts "Heapsort"
  build_max_heap(a,n)

  large = n
  i = n
  while(i>=2) do
    temp = a[1]
    a[1] = a[i]
    a[i] = temp
    large = large - 1
    max_heapify(a,1,large)
    i = i - 1
  end

  for i in 1..n
    print a[i]
  end
  print "\n"

end

#HEAPSORT ENDS


#MERGESORT STARTS
def merge(a,p,q,m)
  b = Array.new(q-p+1)
  i = p
  j = m+1
  k = 0
  while(i<=m && j<=q) do
    if(a[i]<=a[j])
      b[k] = a[i]
      k = k + 1
      i = i + 1
    else
      b[k] = a[j]
      j = j + 1
      k = k + 1
    end
  end

  while(i<=m) do
    b[k] = a[i]
    i = i + 1
    k = k + 1
  end

  while(j<=q) do
    b[k] = a[j]
    i = i + 1
    j = j + 1
  end

  l = 0
  for i in p..q
    a[i] = b[l]
    l = l+1
  end
end

def m_sort(a,p,q)
  if(p<q)
    m = (p+q)/2
    m_sort(a,p,m)
    m_sort(a,m+1,q)
    merge(a,p,q,m)
  end
end

def merge_sort(n,a)
  print "Mergesort\n"
  m_sort(a,0,n-1)
  print(a)
  print"\n"
end

#MERGESORT ENDS


a = Array.new(10,100)

print "Enter the value of n\n"
n = gets()
n = n.chomp()
n = n.to_i

print "Enter the #{n} numbers\n"
n_numbers = gets()
n_numbers = n_numbers.split(" ")

for i in 0..n-1
  a[i] = n_numbers[i].to_i
end

#bubble_sort(n,a)
#insertion_sort(n,a)
#selection_sort(n,a)
#quick_sort(n,a)
#heapsort(n,a)
#merge_sort(n,a)