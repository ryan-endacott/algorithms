
class Heap

  def initialize
    @size = 0
    @root = nil
    @array = Array.new # let ruby manage resizing, etc
  end

  def insert(*values)
    values.each do |value|
      @array[@size] = value
      self.class.upheap(@size, @array)
      @size += 1
    end
  end

  def delete_min
    min = @array[0]
    @size -= 1
    @array[0] = @array[@size]
    @array[@size] = nil
    self.class.downheap(0, @array, @size)
    return min
  end

  def min
    @array[0]
  end

  def self.downheap(index, array, size)
    while index * 2 < size
      child = index * 2
      # try to switch with the smaller child
      child += 1 if array[child + 1] and array[child + 1] < array[child] 
      if array[child] < array[index]
        array[child], array[index] = array[index], array[child]
        index = child
      else
        break
      end
    end
  end
    
  def self.upheap(index, array)
    parent = index / 2
    while index > 0 and array[parent]  > array[index]
      array[parent], array[index] = array[index], array[parent]
      index = parent
      parent = index / 2
    end
  end

  def self.heapsort(array)

    size = array.size
    # heap construction
    mid = size / 2
    mid.downto(0).each do |index|
      downheap(index, array, size)
    end

    # sortdown
    while size > 0
      size -= 1
      array[0], array[size] = array[size], array[0]
      downheap(0, array, size)
    end

    return array
  end

end


