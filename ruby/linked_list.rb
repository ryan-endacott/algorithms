
# KeyValue linked list for hashtable implementation

class LinkedList

  def insert_or_update(key, value)
  end

  def insert_at_head(key, value)
  end

  def insert_at_tail(key, value)
  end

  def remove(key)
  end

end

class Node

  attr_accessor :key, :value, :next

  def initialize(key, value, next = nil)
    @key = key
    @value = value
    @next = next
  end

end
