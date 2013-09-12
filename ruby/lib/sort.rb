


# quickselect to get the kth largest integer in a list
def quickselect(arr, k)

  if k > arr.length
    puts 'Error: Not enough items in list'
    return
  end

  # choose random pivot
  r = Random.rand(0...arr.length)
  pivot = arr[r]

  a1 = []
  a2 = []

  # partition array
  arr.each do |v|
    if v < pivot
      a1.push(v)
    elsif v > pivot
      a2.push(v)
    end
  end

  
  if k <= a1.length # in small list
    return quickselect(a1, k)
  elsif k > arr.length - a2.length # in big list
    return quickselect(a2, k - (arr.length - a2.length))
  else # otherwise it equals pivot
    return pivot
  end
end

def quicksort(arr)
end

def partition(arr)

end

def mergesort(arr, left, right)
  return arr if left >= right
  mid = (left + right) / 2
  mergesort(arr, left, mid)
  mergesort(arr, mid + 1, right)
  merge(arr, left, mid, right)
end

def merge(arr, left, mid, right)

  helper = []
  (left..right).each do |i|
    helper[i] = arr[i]
  end

  helperleft = left
  helperright = mid + 1
  current = left

  while helperleft <= mid and helperright <= right
    if helper[helperleft] <= helper[helperright]
      arr[current] = helper[helperleft]
      helperleft += 1
    else
      arr[current] = helper[helperright]
      helperright += 1
    end
    current += 1
  end

  # copy remaining from left back in (right is already there)
  rem = mid - helperleft
  (0..rem).each do |i|
    arr[current + i] = helper[helperleft + i]
  end
  return arr
end

