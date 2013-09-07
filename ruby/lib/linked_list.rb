
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

  def get(key)
    node = self.find { |n| n.key == key}
    if node
      return node.value
    else
      return nil
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

  def remove(key)
    current = @head
    while current != nil do
      if current.key == key # gonna delete
        if @head == current
          @head = current.next
        else
          n = current.next
          current.key = n.key
          current.value = n.value
          current.next = n.next
          #free n?
        end
      end
      current = current.next
    end
  end
end

