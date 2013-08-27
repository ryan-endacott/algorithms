
# KeyValue linked list for hashtable implementation

Node = Struct.new(:key, :value, :next)

# KeyValue LinkedList for HashTable
# Doesn't enforce unique contents, can have duplicate keys
class LinkedList
  include Enumerable

  attr_reader :length

  def initialize
    @head = nil
    @length = 0
  end

  def each
    current = @head
    while current != nil do
      yield current
      current = current.next
    end
  end

  def insert_or_update(key, value)
    node = self.find { |n| n.key == key}
    if node
      node.value = value
    else
      insert(key, value)
    end
  end

  def insert_at_head(key, value)
    if @head == nil
      @head = Node.new(key, value)
    else
      @head = Node.new(key, value, @head)
    end
    @length += 1
  end

  alias_method :insert, :insert_at_head

  def insert_at_tail(key, value)
    if @head == nil
      @head = Node.new(key, value)
    else
      current = @head

      while current.next != nil do # set current to tail
        current = current.next
      end

      current.next = Node.new(key, value)
    end
    @length += 1
  end

  def remove(key)
    current = @head
    while current != nil do
      if current.key == key # gonna delete
        if current == @head
          @head = current.next
        elsif current == @tail
          @tail = prev
        end
        prev.next = current.next
        # free it?
        return current.value
      end
      prev = current
      current = current.next
    end
  end

end

